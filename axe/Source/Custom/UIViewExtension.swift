//
//  UIViewExtension.swift
//  axe
//
//  Created by 조선미 on 2021/03/17.
//

import Foundation
import UIKit
import SnapKit

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
    
    func cornerWithMaskToBound(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        self.layer.masksToBounds = false
    }
    
    func border(width: CGFloat, color: UIColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }

}

extension UIImageView {
    
    func tinted(image: UIImage, color: UIColor) {
        self.tintColor = color
        let image = image.withRenderingMode(.alwaysTemplate)
        self.image = image
    }
    
}

extension UIButton {
    
    func tinted(image: UIImage, color: UIColor) {
        self.tintColor = color
        let image = image.withRenderingMode(.alwaysTemplate)
        self.setImage(image, for: .normal)
    }
    
}

