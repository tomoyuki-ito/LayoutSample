//
//  MypageViewController.swift
//  LayoutSample
//
//  Created by Tomoyuki Ito on 2018/05/15.
//  Copyright © 2018 Nagisa Inc. All rights reserved.
//

import UIKit

class MypageViewController: UIViewController {
    
    let start: UIColor = UIColor(red: 255/255.0, green: 128/255.0, blue: 245/255.0, alpha: 1)
    let end: UIColor = UIColor(red: 255/255.0, green: 73/255.0, blue: 232/255.0, alpha: 1)
    
    var container: GradientBaseView {
        return self.view as! GradientBaseView
    }
    
    override func loadView() {
        self.view = GradientBaseView(colors: [start, end])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "さやかちゃん"
        
        container.makeConstraints(viewController: self)
        container.selectItemHandler = { [weak self] _ in
            let vc = DetailViewController()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        container.collectionView.reloadData()
    }
    
}
