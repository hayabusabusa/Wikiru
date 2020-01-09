//
//  Article.swift
//  Model
//
//  Created by Yamada Shunya on 2020/01/09.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import Foundation

public struct Article: Decodable {
    public let id: Int
    public let title: String?
    public let size: Int
    public let wordCount: Int
    public let timestamp: String?
    
    private enum CodingKeys: String, CodingKey {
        case id = "pageid"
        case title
        case size
        case wordCount = "wordcount"
        case timestamp
    }
}
