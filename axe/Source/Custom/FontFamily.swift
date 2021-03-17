//
//  FontFamily.swift
//  axe
//
//  Created by 조선미 on 2021/01/22.
//

import Foundation
import UIKit

enum FontFamily: String {
    case light = "GmarketSansLight"
    case medium = "GmarketSansMedium"
}

extension UIFont {
    convenience init(fontFamily: FontFamily, size: CGFloat) {
        self.init(name: fontFamily.rawValue, size: size)!
    }
}
