//
//  SearchViewController.swift
//  Wikiru
//
//  Created by Yamada Shunya on 2020/01/10.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import UIKit
import Model

final class SearchViewController: BaseViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: Properties
    
    private let model: SearchModelImpl = SearchModelImpl()
    
    private var dataSource: [Article] = [Article]()
    
    // MARK: Overrides
    
    // MARK: Lifecycle
    
    static func instantiate() -> SearchViewController {
        return Storyboard.SearchViewController.instantiate(SearchViewController.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupTableView()
        setupModel()
    }
}

// MARK: - Setup

extension SearchViewController {
    
    private func setupNavigation() {
        let searchController = UISearchController()
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.delegate = self
        searchController.searchBar.delegate = self
        navigationItem.title = "WiKiRu"
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.searchController = searchController
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.setState(.empty(message:"リストが空です。\n検索バーから検索を行ってみてください 🔎"))
        tableView.register(SearchCell.nib, forCellReuseIdentifier: SearchCell.reuseIdentifier)
    }
    
    private func setupModel() {
        model.delegate = self
    }
}

// MARK: - Transition

extension SearchViewController {
    
    private func presentSafari(title: String) {
        guard let encoded = title.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: "https://ja.wikipedia.org/wiki/\(encoded)") else { return }
        let vc = SafariViewController(url: url)
        present(vc, animated: true, completion: nil)
    }
}

// MARK: - Model delegate

extension SearchViewController: SearchModelDelegate {
    
    func onSuccess(articles: [Article]) {
        dataSource = articles
        tableView.reloadData()
        tableView.setState(dataSource.isEmpty ? .empty(message:"リストが空です。\n検索バーから検索を行ってみてください 🔎") : .none)
    }
    
    func onError(message: String) {
        tableView.setState(.error(message: "エラーが発生しました。\nReason: \(message)"))
    }
}

// MARK: - SearchController delegate

extension SearchViewController: UISearchBarDelegate, UISearchControllerDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyword = searchBar.text else { return }
        model.getArticles(keyword: keyword)
        tableView.setState(.loading)
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return true
    }
}

// MARK: - TableView dataSource

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.reuseIdentifier, for: indexPath) as! SearchCell
        let article = dataSource[indexPath.row]
        cell.setupCell(title: article.title, wordCount: article.wordCount, readTime: article.readMinute, timestamp: article.formattedTimestamp)
        return cell
    }
}

// MARK: - TableView delegate

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presentSafari(title: dataSource[indexPath.row].title ?? "")
    }
}
