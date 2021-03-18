//
//  BookNoteCell.swift
//  axe
//
//  Created by 조선미 on 2021/03/18.
//

import UIKit

class BookNoteCell: UITableViewCell {
    
    private lazy var typeIconView = UIImageView()
    private lazy var dateLabel = UILabel(fontFamily: .light, size: 11)
    private lazy var editButton = UIButton()
    private lazy var titleLabel = UILabel(fontFamily: .medium, size: 14)
    private lazy var contentsLabel = UILabel(fontFamily: .light, size: 14)
    private lazy var divier = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.attribute()
        self.layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(note: Content) {
        
        self.dateLabel.text = "#2001 . 12 . 17 (10p. ~ 12p.)"
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = 7
       
        let title = NSMutableAttributedString(string: note.title)
        title.addAttributes([.paragraphStyle : paragraph], range: NSRange(location: 0, length: title.string.count))
        self.titleLabel.attributedText = title
        
        let content = NSMutableAttributedString(string: note.content)
        content.addAttributes([.paragraphStyle : paragraph], range: NSRange(location: 0, length: content.string.count))
        self.contentsLabel.attributedText = content
    }
    
    private func attribute() {
        self.selectionStyle = .none
        self.titleLabel.textColor = .axe_contents_tint
        self.titleLabel.numberOfLines = 0
        self.contentsLabel.textColor = .axe_contents
        self.contentsLabel.numberOfLines = 0
        self.divier.backgroundColor = .axe_tint_10
        self.dateLabel.textColor = .axe_tint
        self.typeIconView.tinted(image: #imageLiteral(resourceName: "typeSymbol_quote"), color: .axe_contents_tint_20)
    }
    
    private func layout() {
        self.contentView.addSubview(typeIconView)
        self.contentView.addSubview(dateLabel)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(contentsLabel)
        self.contentView.addSubview(divier)
    
        self.dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.lessThanOrEqualTo(typeIconView.snp.leading).offset(-12)
        }

        self.typeIconView.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.centerY.equalTo(dateLabel)
            $0.trailing.equalToSuperview().offset(-24)
        }
    
        self.titleLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
        }

        self.contentsLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.left.equalTo(titleLabel)
            $0.trailing.equalToSuperview().offset(-24)
        }

        self.divier.snp.makeConstraints {
            $0.top.equalTo(contentsLabel.snp.bottom).offset(24)
            $0.leading.bottom.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}

