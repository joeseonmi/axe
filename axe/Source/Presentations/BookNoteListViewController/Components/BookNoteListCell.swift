//
//  BookNoteListCell.swift
//  axe
//
//  Created by 조선미 on 2021/03/29.
//

import UIKit

class BookNoteListCell: UICollectionViewCell {
    
    private var background = UIView()
    private var bookImageView = BookImageView()
    private var titleLabel = UILabel(fontFamily: .medium, size: 14)
    private var infoLabel = UILabel(fontFamily: .light, size: 12)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.attribute()
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(data: [String: String]) {
        let string = NSMutableAttributedString(string: data["title"] ?? "호에에에엥")
        let paragraph = NSMutableParagraphStyle()
        paragraph.minimumLineHeight = 18
        string.addAttributes([.font : UIFont(fontFamily: .medium, size: 14),
                              .paragraphStyle: paragraph],
                             range: NSMakeRange(0, string.length))
        self.titleLabel.attributedText = string
        self.titleLabel.text = data["title"] ?? "호에에에엥"
        self.infoLabel.text =  data["info"] ?? "호에에에에엥"
        self.bookImageView.configureView()
    }
    
    private func attribute() {
        self.backgroundColor = .white
        self.background.backgroundColor = .axe_BG01
        self.background.corner(radius: 4)
        self.titleLabel.textColor = .axe_contents
        self.titleLabel.numberOfLines = 2
        self.infoLabel.textColor = .axe_contents
    }
    
    private func layout() {
        self.contentView.addSubview(background)
        self.background.addSubview(bookImageView)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(infoLabel)
        
        self.background.snp.makeConstraints {
            let width = (UIScreen.main.bounds.width - 40) / 2
            $0.width.equalTo(width)
            $0.height.equalTo(self.background.snp.width)
            $0.top.leading.trailing.equalToSuperview()
        }
        self.bookImageView.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(0.5)
            $0.height.equalTo(self.bookImageView.snp.width).multipliedBy(1.45)
            $0.center.equalToSuperview()
        }
        self.titleLabel.snp.makeConstraints {
            $0.top.equalTo(background.snp.bottom).offset(8)
            $0.leading.equalTo(background).offset(8)
            $0.trailing.equalTo(background).offset(-8)
        }
        self.infoLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalTo(titleLabel)
            $0.bottom.lessThanOrEqualToSuperview().offset(-20)
        }
        
    }
    
}
