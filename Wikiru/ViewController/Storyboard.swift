//
//  Storyboard.swift
//  Wikiru
//
//  Created by Yamada Shunya on 2020/01/09.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import UIKit

enum Storyboard: String {
    case RootViewController
    case SearchViewController
    
    func instantiate<VC: UIViewController>(_: VC.Type, inBundle: Bundle? = nil) -> VC {
        guard let vc = UIStoryboard(name: self.rawValue, bundle: inBundle).instantiateInitialViewController() as? VC else {
            fatalError("Couldn't instantiate \(self.rawValue)")
        }
        return vc
    }
}
