//
//  HomeViewController.swift
//  LayoutSample
//
//  Created by Tomoyuki Ito on 2018/05/14.
//  Copyright © 2018 Nagisa Inc. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let start: UIColor = UIColor(red: 0/255.0, green: 229/255.0, blue: 253/255.0, alpha: 1)
    let end: UIColor = UIColor(red: 0/255.0, green: 199/255.0, blue: 251/255.0, alpha: 1)
    
    var container: GradientBaseView {
        return self.view as! GradientBaseView
    }
    
    override func loadView() {
        self.view = GradientBaseView(colors: [start, end])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ホーム"
        
        container.makeConstraints(viewController: self)
        container.selectItemHandler = { [weak self] _ in
            let vc = DetailViewController()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        container.collectionView.reloadData()
    }
    
}
