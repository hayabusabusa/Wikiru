//
//  UIViewController+Extension.swift
//  Wikiru
//
//  Created by Yamada Shunya on 2020/01/10.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import UIKit

extension UIViewController {

    func replaceRoot(to nextViewController: UIViewController) {
        guard let window = UIApplication.shared.keyWindow else { return }

        if window.rootViewController?.presentedViewController != nil {
            fatalError("\(type(of: self)) has presentedViewController")
        }

        UIView.transition(
            with: window,
            duration: 0.3,
            options: .transitionCrossDissolve,
            animations: { () -> Void in
                let oldState = UIView.areAnimationsEnabled
                UIView.setAnimationsEnabled(false)
                window.rootViewController = nextViewController
                UIView.setAnimationsEnabled(oldState)
            },
            completion: nil
        )
    }
}
