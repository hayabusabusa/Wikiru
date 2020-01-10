//
//  SearchModel.swift
//  Model
//
//  Created by Yamada Shunya on 2020/01/10.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import Foundation

// MARK: - Interface

public protocol SearchModel {
    func getArticles(keyword: String)
}

// MARK: - Implemantation

public class SearchModelImpl: SearchModel {
    
    // MARK: Properties
    
    private let apiClient: APIClientProtocol
    
    private var isFetching: Bool = false
    public weak var delegate: SearchModelDelegate?
    
    // MARK: Initializer
    
    public init(apiClient: APIClientProtocol = APIClient.shared) {
        self.apiClient = apiClient
    }
    
    // MARK: API
    
    public func getArticles(keyword: String) {
        guard isFetching == false else { return } // 無駄なリクエスト防止
        isFetching = true
        
        apiClient.getArticles(keyword: keyword) { [weak self] result in
            self?.isFetching = false
            
            DispatchQueue.main.async {
                switch result {
                case .success(let articles):
                    self?.delegate?.onSuccess(articles: articles)
                case .failure(let error):
                    self?.delegate?.onError(message: error.localizedDescription)
                }
            }
        }
    }
}
