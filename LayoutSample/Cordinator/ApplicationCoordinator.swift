//
//  ApplicationCoordinator.swift
//  LayoutSample
//
//  Created by Tomoyuki Ito on 2018/05/15.
//  Copyright © 2018 Nagisa Inc. All rights reserved.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    
    var viewController: UIViewController? { return self.window.rootViewController }
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        self.window.rootViewController = createRootViewController()
        self.window.makeKeyAndVisible()
    }

    private func createRootViewController() -> UIViewController {
        let tab = UITabBarController()
        let vcs: [UIViewController] = [
            HomeViewController(),
            EventViewController(),
            MypageViewController()
        ]
        let navis = vcs.compactMap({ TransparentNavigationController(rootViewController: $0) })
        tab.setViewControllers(navis, animated: false)
        return tab
    }
    
}
