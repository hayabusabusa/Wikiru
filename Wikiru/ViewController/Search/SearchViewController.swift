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
    
    // MARK: Overrides
    
    // MARK: Lifecycle
    
    static func instantiate() -> SearchViewController {
        return Storyboard.SearchViewController.instantiate(SearchViewController.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupTableView()
    }
}

// MARK: - Setup

extension SearchViewController {
    
    private func setupNavigation() {
        let searchController = UISearchController()
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
        tableView.register(SearchCell.nib, forCellReuseIdentifier: SearchCell.reuseIdentifier)
    }
}

// MARK: - SearchController delegate

extension SearchViewController: UISearchBarDelegate, UISearchControllerDelegate {
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        print(searchBar.text ?? "nil")
        return true
    }
}

// MARK: - TableView dataSource

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.reuseIdentifier, for: indexPath) as! SearchCell
        return cell
    }
}

// MARK: - TableView delegate

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
