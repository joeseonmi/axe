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
