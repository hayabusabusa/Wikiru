//
//  ViewController.swift
//  Wikiru
//
//  Created by Yamada Shunya on 2020/01/09.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import UIKit
import Model

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let client = APIClient.shared
        client.getArticles(keyword: "Wikipedia") { result in
            switch result {
            case .success(let articles):
                print(articles)
            case .failure(let error):
                print(error)
            }
        }
    }
}

