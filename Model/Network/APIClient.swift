//
//  APIClient.swift
//  Model
//
//  Created by Yamada Shunya on 2020/01/09.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import Foundation

// MARK: - Interface

public protocol APIClientProtocol {
    func getArticles(keyword: String, completion: @escaping ((Result<[Article], Error>) -> Void))
}

// MARK: - Impl

public final class APIClient: APIClientProtocol {
    
    // MARK: Singleton
    
    public static let shared: APIClient = .init()
    
    // MARK: Properties
    
    private let session: URLSession
    private let baseURL: String = "https://ja.wikipedia.org/w/api.php"
    
    // MARK: Init
    
    private init() {
        session = URLSession.shared
    }
    
    // MARK: API
    
    public func getArticles(keyword: String, completion: @escaping ((Result<[Article], Error>) -> Void)) {
        let format = URLQueryItem(name: "format", value: "json")
        let action = URLQueryItem(name: "action", value: "query")
        let list = URLQueryItem(name: "list", value: "search")
        let limit = URLQueryItem(name: "srlimit", value: "30")
        let srsearch = URLQueryItem(name: "srsearch", value: keyword)
        
        var components = URLComponents(string: baseURL)
        components?.queryItems = [format, action, list, limit, srsearch]
        
        let url = components?.url
        
        session.dataTask(with: url!) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                do {
                    let wikiruResponse = try JSONDecoder().decode(WikiruResponse.self, from: data)
                    completion(.success(wikiruResponse.query.search))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
