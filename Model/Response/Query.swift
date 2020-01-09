//
//  Query.swift
//  Model
//
//  Created by Yamada Shunya on 2020/01/09.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import Foundation

public struct Query: Decodable {
    public let search: [Article]
}
