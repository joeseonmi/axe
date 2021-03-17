//
//  Labels.swift
//  axe
//
//  Created by 조선미 on 2021/01/22.
//

import UIKit
import SnapKit

extension UILabel {
    convenience init(fontFamily: FontFamily, size: CGFloat) {
        self.init()
        self.font = UIFont(name: fontFamily.rawValue, size: size)
        self.textColor = .axe_contents
    }
}

extension UIButton {
   
}

extension UIView {
    var safeArea: ConstraintBasicAttributesDSL {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.snp
        } else {
            return self.snp
        }
    }
    
    func corner(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func border(width: CGFloat, color: UIColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}
