//
//  TransparentNavigationController.swift
//  LayoutSample
//
//  Created by Tomoyuki Ito on 2018/05/15.
//  Copyright © 2018 Nagisa Inc. All rights reserved.
//

import UIKit

class TransparentNavigationController: UINavigationController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override init(rootViewController: UIViewController) {
        print(#function)
        super.init(rootViewController: rootViewController)
        setup()
    }
    
    override init(navigationBarClass: AnyClass?, toolbarClass: AnyClass?) {
        print(#function)
        super.init(navigationBarClass: navigationBarClass, toolbarClass: toolbarClass)
        setup()
    }
    
    private func setup() {
        let navibar = navigationBar
        if #available(iOS 11.0, *) {
            navibar.prefersLargeTitles = true
            let shadow: NSShadow = NSShadow()
            shadow.shadowOffset = CGSize(width: 0, height: 1)
            shadow.shadowBlurRadius = 2
            shadow.shadowColor = UIColor(white: 0, alpha: 0.25)
            navibar.largeTitleTextAttributes = [
                .foregroundColor: UIColor.white,
                .shadow: shadow
            ]
        }
        navibar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navibar.barTintColor = .clear
        navibar.tintColor = .white
        navibar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navibar.backgroundColor = .clear
    }
    
}
