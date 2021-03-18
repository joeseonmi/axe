//
//  MainViewController.swift
//  axe
//
//  Created by 조선미 on 2021/02/18.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {

    private lazy var button = UIButton()
    private var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
        bind()
    }
    
    func bind() {
        self.button.rx.tap
            .subscribe(onNext: { [weak self] _ in
                guard let `self` = self else { return }
                let vc = BookNoteDetailViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: self.bag)
    }
    
    private func attribute() {
        if let navi = self.navigationController as? AxeNavigationController {
//            navi.hideNaviBar()
        }
        self.view.backgroundColor = .white
        button.setAttributedTitle(title: "이동하쟈", font: .medium, size: 16, color: .axe_contents)
    }
    
    private func layout() {
        self.view.addSubview(button)
        self.button.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}

