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
        self.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "BackButton")
        self.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "BackButton")
    }
    
    func hideNaviBar() {
        self.isNavigationBarHidden = true
    }
    
}
