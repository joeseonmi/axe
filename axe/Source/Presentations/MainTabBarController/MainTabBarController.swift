//
//  MainTabBarController.swift
//  axe
//
//  Created by 조선미 on 2021/03/20.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    enum Tab: Int {
        case notes
        case tracker
        case library
    }
    
    let tabs: [Tab: UITabBarItem] = [
        .notes: UITabBarItem(title: "노트",
                             image: #imageLiteral(resourceName: "icon_write"),
                             selectedImage: #imageLiteral(resourceName: "icon_write")),
        .tracker: UITabBarItem(title: "트래커",
                               image: #imageLiteral(resourceName: "icon_write"),
                               selectedImage: #imageLiteral(resourceName: "icon_write")),
        .library: UITabBarItem(title: "내 서재",
                               image: #imageLiteral(resourceName: "icon_write"),
                               selectedImage: #imageLiteral(resourceName: "icon_write"))
    ]
    
    let tabBarHeight: CGFloat = 48.0
    
    let bookNoteDetailView = BookNoteDetailViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.attribute()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setRoundedTabBar()
    }
    
    private func attribute() {
        self.view.backgroundColor = .white
        
        bookNoteDetailView.tabBarItem = self.tabs[.notes]
        self.viewControllers = [
            AxeNavigationController(rootViewController: bookNoteDetailView)
        ]
        
        
        
    }
    
    private func setRoundedTabBar() {
        /* 노치 디자인인지 판단 */
        let isNotch = self.view.safeAreaLayoutGuide.layoutFrame.maxY == self.view.frame.maxY
        
        /* 노치 디자인이 아닌경우 하단 마진 추가 */
        let tabBarBottomMargin: CGFloat = isNotch ? 20.0 : 0.0
        tabBar.frame.size.height = tabBarHeight
        
        /* 탭바의 Y좌표 설정 */
        let tabBarY = self.view.safeAreaLayoutGuide.layoutFrame.maxY - tabBarHeight - tabBarBottomMargin
        tabBar.frame.origin.y = tabBarY
        
        /* 탭바의 배경(흐릿한부분)과 그림자를 없애준다 */
        self.tabBar.backgroundImage = UIImage()
        self.tabBar.shadowImage = UIImage()
        self.tabBar.tintColor = .axe_contents_tint

        /* 동그란 쉐입과 그림자 씌워주기 */
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: CGRect(x: 30,
                                                      y: tabBar.bounds.minY,
                                                      width: tabBar.bounds.width - 60,
                                                      height: tabBar.bounds.height),
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
                item.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 2, right: 0)
                item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)
            }
        }
        tabBar.itemWidth = 30.0
        tabBar.itemPositioning = .centered
    }
    
}
