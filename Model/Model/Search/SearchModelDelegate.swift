//
//  SearchModelDelegate.swift
//  Model
//
//  Created by Yamada Shunya on 2020/01/10.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import Foundation

public protocol SearchModelDelegate: AnyObject {
    func onSuccess(articles: [Article])
    func onError(message: String)
}
