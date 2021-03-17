//
//  BookNoteDetailHeaderView.swift
//  axe
//
//  Created by 조선미 on 2021/03/17.
//

import UIKit

class BookNoteDetailHeaderView: UIView {
    
    private lazy var dot = UIView()
    private lazy var titleLabel = UILabel(fontFamily: .light, size: 18)
    private lazy var bookInfoBGView = UIView()
    private lazy var bookImageView = BookImageView()
    private lazy var bookTitleLabel = UILabel(fontFamily: .medium, size: 16)
    private lazy var bookWriterLabel = UILabel(fontFamily: .light, size: 14)
    private lazy var totalInfoLabel = UILabel(fontFamily: .light, size: 12)
    private lazy var ratingLabel = UILabel(fontFamily: .light, size: 12)
    private lazy var divider = UIView()
    
    private lazy var patternView = UIView()
    private lazy var stackView = UIStackView()
    private lazy var divider2 = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.attribute()
        self.layout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        titleLabel.text = "지금 읽고 있는 책"
        bookTitleLabel.text = "7년의 밤"
        bookWriterLabel.text = "정유정"
        totalInfoLabel.text = "인용: 0 | 생각: 5 | 질문: 0"
        ratingLabel.text = "평점: 4.5"
    }
    
    func expand(on: Bool) {
        
    }
    
    private func attribute() {
        self.dot.backgroundColor = .axe_tint
        self.dot.alpha = 0.1
        self.dot.corner(radius: 14)
        self.bookInfoBGView.backgroundColor = .axe_BG01
        self.titleLabel.textColor = .axe_contents
        self.bookTitleLabel.textColor = .axe_contents
        self.bookWriterLabel.textColor = .axe_contents
        self.totalInfoLabel.textColor = .axe_contents
        self.ratingLabel.textColor = .axe_contents
        self.divider.backgroundColor = .axe_tint
        
        self.patternView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "pattern"))
        self.divider2.backgroundColor = .axe_tint
        self.divider2.alpha = 0.1
        
        self.stackView.axis = .horizontal
        self.stackView.spacing = 15
        let test = HighlighterButton()
        test.setTitle("질문", for: .normal)
        let test2 = HighlighterButton()
        test2.setTitle("인용문", for: .normal)
        test.isOn(true)
        self.stackView.addArrangedSubview(test)
        self.stackView.addArrangedSubview(test2)
        
    }
    
    private func layout() {
        self.addSubview(dot)
        self.addSubview(titleLabel)
        self.addSubview(bookInfoBGView)
        self.bookInfoBGView.addSubview(bookImageView)
        self.bookInfoBGView.addSubview(bookTitleLabel)
        self.bookInfoBGView.addSubview(bookWriterLabel)
        self.bookInfoBGView.addSubview(totalInfoLabel)
        self.bookInfoBGView.addSubview(ratingLabel)
        self.bookInfoBGView.addSubview(divider)
        self.addSubview(patternView)
        self.addSubview(stackView)
        self.addSubview(divider2)
        
        self.dot.snp.makeConstraints {
            $0.width.height.equalTo(28)
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalToSuperview().offset(12)
        }
        
        self.titleLabel.snp.makeConstraints {
            $0.top.equalTo(dot.snp.centerY)
            $0.leading.equalTo(dot.snp.centerX)
            $0.trailing.greaterThanOrEqualToSuperview().offset(-12)
        }
        
        self.bookInfoBGView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
        }
        
        self.bookImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalTo(titleLabel)
            $0.width.equalToSuperview().multipliedBy(0.3)
            $0.height.equalTo(self.bookImageView.snp.width).multipliedBy(1.45)
            $0.bottom.lessThanOrEqualToSuperview().offset(-40)
        }
        
        self.bookTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalTo(bookImageView.snp.trailing).offset(12)
            $0.trailing.greaterThanOrEqualToSuperview().offset(-12)
        }
        
        self.bookWriterLabel.snp.makeConstraints {
            $0.top.equalTo(bookTitleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(bookTitleLabel)
            $0.trailing.equalToSuperview().offset(-12)
        }
        
        self.totalInfoLabel.snp.makeConstraints {
            $0.top.equalTo(bookWriterLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(bookWriterLabel)
        }
        
        self.ratingLabel.snp.makeConstraints {
            $0.top.equalTo(totalInfoLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalTo(bookWriterLabel)
        }
        
        self.divider.snp.makeConstraints {
            $0.top.equalTo(ratingLabel.snp.bottom).offset(20)
            $0.height.equalTo(1)
            $0.width.equalTo(60)
            $0.leading.equalTo(bookWriterLabel)
            $0.bottom.lessThanOrEqualToSuperview().offset(-40)
        }
        
        self.patternView.snp.makeConstraints {
            $0.height.equalTo(24)
            $0.top.equalTo(bookInfoBGView.snp.bottom).offset(-24)
            $0.leading.trailing.equalToSuperview()
        }
        
        self.stackView.snp.makeConstraints {
            $0.top.equalTo(patternView.snp.bottom).offset(4)
            $0.trailing.equalToSuperview().offset(-13)
            $0.leading.greaterThanOrEqualToSuperview().offset(13)
        }
        
        self.divider2.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(4)
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview()
//            $0.bottom.equalToSuperview()
        }
        
    }

}
