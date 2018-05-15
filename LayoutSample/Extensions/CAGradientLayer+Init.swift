//
//  CAGradientLayer+Init.swift
//  LayoutSample
//
//  Created by Tomoyuki Ito on 2018/05/14.
//  Copyright © 2018 Nagisa Inc. All rights reserved.
//

import UIKit

extension CAGradientLayer {
    
    public convenience init(frame: CGRect, colors: [UIColor]) {
        self.init()
        self.frame = frame
        self.colors = []
        for color in colors {
            self.colors?.append(color.cgColor)
        }
        startPoint = CGPoint(x: 0, y: 0.5)
        endPoint = CGPoint(x: 1, y: 0.5)
    }
    
}
