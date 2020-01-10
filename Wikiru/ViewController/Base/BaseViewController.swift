//
//  BaseViewController.swift
//  Wikiru
//
//  Created by Yamada Shunya on 2020/01/10.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: IBOutlet
    
    // MARK: Properties
    
    // MARK: Lifecycle
    
    deinit {
        print("[DEINIT] ✨🧹 \(type(of: self)) was deallocated.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
