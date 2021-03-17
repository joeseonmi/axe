//
//  Buttons.swift
//  axe
//
//  Created by 조선미 on 2021/02/18.
//

import Foundation
import UIKit

extension UIButton {
    func setAttributedTitle(title: String, font: FontFamily, size: CGFloat, color: UIColor) {
        let title = NSAttributedString(string: title,
                                       attributes: [.font : UIFont(fontFamily: font, size: size),
                                                    .foregroundColor : color])
        self.setAttributedTitle(title, for: .normal)
    }
}
