//
//  HighlighterButton.swift
//  axe
//
//  Created by 조선미 on 2021/03/17.
//

import UIKit

class HighlighterButton: UIButton {

    private lazy var highlighter = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        let attriTitle = NSAttributedString(string: title ?? "",
                                            attributes: [.font : UIFont(fontFamily: .light, size: 14),
                                                          .foregroundColor : UIColor.axe_contents])
        self.setAttributedTitle(attriTitle, for: .normal)
    }
    
    func isOn(_ on: Bool) {
        self.highlighter.isHidden = !on
        guard let title = self.attributedTitle(for: .normal) else { return }
        let attriTitle = NSAttributedString(string: title.string,
                                            attributes: [.font : on ? UIFont(fontFamily: .medium, size: 14) : UIFont(fontFamily: .light, size: 14),
                                                         .foregroundColor : on ? UIColor.axe_contents_tint : UIColor.axe_contents ])
        self.setAttributedTitle(attriTitle, for: .normal)
    }
    
    private func layout() {
        self.addSubview(highlighter)
        self.highlighter.backgroundColor = .axe_tint
        self.highlighter.alpha = 0.2
        self.highlighter.snp.makeConstraints { [weak self] con in
            guard let `self` = self, let titleLabel = self.titleLabel else { return }
            con.top.equalTo(titleLabel.snp.top).offset(3)
            con.leading.equalTo(titleLabel.snp.leading).offset(-2)
            con.trailing.equalTo(titleLabel.snp.trailing).offset(2)
            con.bottom.equalTo(titleLabel.snp.bottom).offset(-3)
        }
        self.highlighter.isHidden = true
    }

}
