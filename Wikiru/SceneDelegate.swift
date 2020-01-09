//
//  SceneDelegate.swift
//  Wikiru
//
//  Created by Yamada Shunya on 2020/01/09.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Setup root vc
        setupRoot(windowScene)
    }
}

extension SceneDelegate {
    
    private func setupRoot(_ windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = RootViewController.instantiate()
        self.window = window
        window.makeKeyAndVisible()
    }
}
