//
//  AxeNavigationController.swift
//  axe
//
//  Created by 조선미 on 2021/03/17.
//

import UIKit

class AxeNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
    }
    
    private func attribute() {
        self.navigationBar.barTintColor = .white
        self.navigationBar.isTranslucent = false
        self.navigationBar.shadowImage = UIImage()
        self.hidesBarsWhenKeyboardAppears = true
        self.navigationBar.tintColor = .axe_contents
        let backImage = #imageLiteral(resourceName: "BackButton")
        self.navigationBar.backIndicatorImage = backImage
        self.navigationBar.backIndicatorTransitionMaskImage = backImage
    }
    
    func hideNaviBar() {
        self.isNavigationBarHidden = true
    }
    
}
