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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell() {
        
    }
    
    private func attribute() {
        self.background.backgroundColor = .axe_BG01
        self.background.corner(radius: 4)
        self.titleLabel.textColor = .axe_contents
        self.infoLabel.textColor = .axe_contents
    }
    
    private func layout() {
        self.contentView.addSubview(background)
        [
            bookImageView,
            titleLabel,
            infoLabel].forEach { self.background.addSubview($0) }
        
        self.background.snp.makeConstraints {
            $0.width.equalToSuperview()
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
            $0.bottom.equalToSuperview().offset(20)
        }
        
    }
    
}
