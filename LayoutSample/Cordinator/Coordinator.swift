//
//  Coordinator.swift
//  LayoutSample
//
//  Created by Tomoyuki Ito on 2018/05/15.
//  Copyright © 2018 Nagisa Inc. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    
    var viewController: UIViewController? { get }
    
    func start()
    
}
