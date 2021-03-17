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

class MainViewController: AxeNavigationController {

//    enum Menu: String, CaseIterable {
//        case note = "노트"
//        case tracker = "트래커"
//        case library = "내서재"
//    }
    
    private lazy var scrollView = UIScrollView()
    private lazy var container = UIView()
    private lazy var menuStackView = UIStackView()
    private lazy var menuList: [UnderLineBtn] = []
    private var disposeBag = DisposeBag()
    
    private lazy var noteBtn = UnderLineBtn()
    private lazy var trackerBtn = UnderLineBtn()
    private lazy var libraryBtn = UnderLineBtn()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
        bind()
    }
    
    func bind() {
        let vc = BookNoteDetailViewController()
        self.pushViewController(vc, animated: true)

        self.noteBtn.rx.tap
            .subscribe(onNext: { [weak self] _ in
                guard let `self` = self else { return }
                self.menuList.forEach { $0.isOn($0 == self.noteBtn) }
                let vc = BookNoteDetailViewController()
                self.pushViewController(vc, animated: true)
            })
            .disposed(by: self.disposeBag)

        self.trackerBtn.rx.tap
            .subscribe(onNext: { [weak self] _ in
                guard let `self` = self else { return }
                self.menuList.forEach { $0.isOn($0 == self.trackerBtn) }
            })
            .disposed(by: self.disposeBag)

        self.libraryBtn.rx.tap
            .subscribe(onNext: { [weak self] _ in
                guard let `self` = self else { return }
                self.menuList.forEach { $0.isOn($0 == self.libraryBtn) }
            })
            .disposed(by: self.disposeBag)
        
    }
    
    private func attribute() {
        self.hideNaviBar()
        self.menuList = [self.noteBtn, self.trackerBtn, self.libraryBtn]
        self.noteBtn.setTitle("노트", for: .normal)
        self.trackerBtn.setTitle("트래커", for: .normal)
        self.libraryBtn.setTitle("내 서재", for: .normal)
        
        self.view.backgroundColor = .white
        self.menuStackView.axis = .horizontal
        self.menuStackView.spacing = 15
        self.menuList.forEach { [weak self] button in
            guard let `self` = self else { return }
            self.menuStackView.addArrangedSubview(button)
        }
    }
    
    private func layout() {
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.container)
        self.container.addSubview(self.menuStackView)
        
        self.scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeArea.top)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeArea.bottom)
        }
        
        self.container.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        self.menuStackView.snp.makeConstraints {
            $0.top.equalTo(view.safeArea.top).offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.leading.greaterThanOrEqualToSuperview().offset(16)
        }
        
    }
}

