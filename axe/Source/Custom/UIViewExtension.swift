//
//  UIViewExtension.swift
//  axe
//
//  Created by 조선미 on 2021/03/17.
//

import Foundation
import UIKit

extension UIView {
    func cornerWithMaskToBound(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        self.layer.masksToBounds = false
    }
}
