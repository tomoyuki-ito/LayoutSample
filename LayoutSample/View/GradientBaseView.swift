//
//  HomeView.swift
//  LayoutSample
//
//  Created by Tomoyuki Ito on 2018/05/14.
//  Copyright © 2018 Nagisa Inc. All rights reserved.
//

import UIKit
import SnapKit

public class GradientBaseView: UIView {
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    var gradientColors: [UIColor] = [.red, .blue]
    
    lazy var gradientLayer: CALayer = {
        let layer = CAGradientLayer(
            frame: .zero,
            colors: gradientColors
        )
        self.layer.insertSublayer(layer, at: 0)
        return layer
    }()

    var selectItemHandler: ((Int) -> Void)?
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    convenience init(colors: [UIColor]) {
        self.init(frame: .zero)
        self.gradientColors = colors
    }
    
    private func setup() {
        addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 100)
            layout.minimumLineSpacing = 1
        }
    }
    
    func makeConstraints(viewController: UIViewController) {
        collectionView.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(self.safeAreaLayoutGuide.snp.topMargin)
                make.bottom.left.right.equalToSuperview()
            } else {
                make.top.equalTo(viewController.topLayoutGuide.snp.bottom)
                make.bottom.left.right.equalToSuperview()
            }
            viewController.automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
    }
    
}

extension GradientBaseView: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.contentView.backgroundColor = .white
        if indexPath.item == 0 {
            let target = cell.contentView.layer
            if #available(iOS 11.0, *) {
                target.cornerRadius = 10
                target.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            } else {
                let rect = self.bounds
                let maskPath = UIBezierPath(
                    roundedRect: rect,
                    byRoundingCorners: [.topLeft, .topRight],
                    cornerRadii: CGSize(width: 8, height: 8)
                )
                let maskLayer = CAShapeLayer()
                maskLayer.frame = rect
                maskLayer.path = maskPath.cgPath
                target.mask = maskLayer
            }
        } else {
            cell.layer.cornerRadius = 0
        }
        return cell
    }
    
}

extension GradientBaseView: UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectItemHandler?(indexPath.item)
    }
    
}
