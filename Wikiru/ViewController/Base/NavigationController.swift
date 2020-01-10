//
//  NavigationController.swift
//  Wikiru
//
//  Created by Yamada Shunya on 2020/01/10.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }
}

// MARK: - Setup

extension NavigationController {
    
    private func setupAppearance() {
        navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
    }
}
