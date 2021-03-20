//
//  MainTabBarController.swift
//  axe
//
//  Created by 조선미 on 2021/03/20.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.attribute()
    }
    
    private func attribute() {
        self.setRoundedTabBar()
        self.view.backgroundColor = .white
        self.tabBar.backgroundImage = UIImage()
        self.tabBar.shadowImage = UIImage()
    }
    
    private func setRoundedTabBar() {
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: CGRect(x: 20,
                                                      y: self.view.safeAreaLayoutGuide.layoutFrame.size.height - 30,
                                                      width: tabBar.bounds.width - 40,
                                                      height: tabBar.bounds.height + 10),
                                  cornerRadius: (tabBar.frame.width/2)).cgPath
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.2
        layer.borderWidth = 1.0
        layer.opacity = 1.0
        layer.isHidden = false
        layer.masksToBounds = false
        layer.fillColor = UIColor.white.cgColor
      
        tabBar.layer.insertSublayer(layer, at: 0)

        if let items = tabBar.items {
            items.forEach { item in
                item.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -15, right: 0)
            }
        }

        tabBar.itemWidth = 30.0
        tabBar.itemPositioning = .centered
    }
    
}
