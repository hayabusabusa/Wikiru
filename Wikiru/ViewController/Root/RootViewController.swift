//
//  RootViewController.swift
//  Wikiru
//
//  Created by Yamada Shunya on 2020/01/09.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import UIKit

final class RootViewController: BaseViewController {
    
    // MARK: IBOutlet
    
    // MARK: Properties
    
    lazy var onViewDidAppear: Void = {
        replaceRootToSearch()
    }()
    
    // MARK: Lifecycle
    
    static func instantiate() -> RootViewController {
        return Storyboard.RootViewController.instantiate(RootViewController.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        _ = onViewDidAppear
    }
}

// MARK: - Transtion

extension RootViewController {
    
    private func replaceRootToSearch() {
        let vc = NavigationController(rootViewController: SearchViewController.instantiate())
        replaceRoot(to: vc)
    }
}
