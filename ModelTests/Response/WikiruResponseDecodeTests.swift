//
//  WikiruResponseDecodeTests.swift
//  ModelTests
//
//  Created by Yamada Shunya on 2020/01/09.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import XCTest
import Model
@testable import Wikiru

class WikiruResponseDecodeTests: XCTestCase {

    func test_APIからのレスポンスからモデルオブジェクトを生成できることを確認() {
        let json = try! Data(contentsOf: Bundle(for: type(of: self)).url(forResource: "raw", withExtension: "json")!)
        
        do {
            try XCTContext.runActivity(named: "ローカルのJSONファイルからモデルオブジェクトが生成できることを確認") { _ in
                XCTAssertNoThrow(try JSONDecoder().decode(WikiruResponse.self, from: json))
            }
        } catch {
            XCTFail("\(error)")
        }
    }
}
