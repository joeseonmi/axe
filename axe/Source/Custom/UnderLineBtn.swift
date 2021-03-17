//
//  UnderLineBtn.swift
//  axe
//
//  Created by 조선미 on 2021/01/22.
//

import UIKit

class UnderLineBtn: UIButton {
    
    private lazy var underLine = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        let attriTitle = NSAttributedString(string: title ?? "",
                                            attributes: [.font : UIFont(fontFamily: .light, size: 16),
                                                          .foregroundColor : UIColor.axe_contents])
        self.setAttributedTitle(attriTitle, for: .normal)
    }
    
    func isOn(_ on: Bool) {
        self.underLine.isHidden = !on
        guard let title = self.attributedTitle(for: .normal) else { return }
        let attriTitle = NSAttributedString(string: title.string,
                                            attributes: [.font : on ? UIFont(fontFamily: .medium, size: 16) : UIFont(fontFamily: .light, size: 16) ])
        self.setAttributedTitle(attriTitle, for: .normal)
    }
    
    private func layout() {
        self.addSubview(underLine)
        self.underLine.backgroundColor = .axe_contents
        self.underLine.snp.makeConstraints { [weak self] con in
            guard let `self` = self, let titleLabel = self.titleLabel else { return }
            con.top.equalTo(titleLabel.snp.bottom).offset(4)
            con.leading.equalTo(titleLabel.snp.leading)
            con.trailing.equalTo(titleLabel.snp.trailing)
            con.height.equalTo(2)
        }
        self.underLine.isHidden = true
    }
    
}
