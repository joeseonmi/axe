//
//  AxeViewController.swift
//  axe
//
//  Created by 조선미 on 2021/03/18.
//

import UIKit

class AxeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
}
