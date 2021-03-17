//
//  BookImageView.swift
//  axe
//
//  Created by 조선미 on 2021/03/17.
//

import UIKit

class BookImageView: UIView {
    
    private lazy var imageView = UIImageView()
    private lazy var shadowView = UIView()
    private lazy var shadowView2 = UIView()
    private lazy var shadowMask = UIView()
    private lazy var accessoryView = UIView()
    private lazy var accessoryView2 = UIView()
    
    //비율 65:100
    var coverImage: UIImage?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        attribute()
        layout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        self.imageView.image = UIImage(named: "test2")
    }
    
    private func attribute() {
        self.imageView.contentMode = .scaleToFill
        self.imageView.corner(radius: 2)
        
        self.shadowView2.cornerWithMaskToBound(radius: 2)
        self.shadowView2.layer.shadowOffset = CGSize(width: -2, height: 2)
        self.shadowView2.layer.shadowRadius = 2
        self.shadowView2.layer.shadowOpacity = 0.25
        self.shadowView2.backgroundColor = .white
        
        self.shadowView.cornerWithMaskToBound(radius: 2)
        self.shadowView.backgroundColor = .white
        self.shadowView.layer.shadowOffset = CGSize(width: -12, height: 4)
        self.shadowView.layer.shadowRadius = 4
        self.shadowView.layer.shadowOpacity = 0.2
        
        self.accessoryView.backgroundColor = .black
        self.accessoryView.alpha = 0.1
        
        self.accessoryView2.backgroundColor = .black
        self.accessoryView2.alpha = 0.25
        self.shadowMask.corner(radius: 2)
        
    }
    
    private func layout() {
        self.addSubview(shadowView)
        self.addSubview(shadowView2)
        self.addSubview(imageView)
        self.addSubview(shadowMask)
        self.shadowMask.addSubview(accessoryView)
        self.shadowMask.addSubview(accessoryView2)
        
        self.shadowView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalTo(imageView)
        }
        self.shadowView2.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalTo(imageView)
        }
        self.imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(5)
            $0.trailing.equalToSuperview().offset(-5)
            $0.bottom.equalToSuperview().offset(-5)
        }
        self.shadowMask.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalTo(imageView)
        }
        self.accessoryView.snp.makeConstraints {
            $0.height.equalTo(imageView).offset(-2)
            $0.width.equalTo(2)
            $0.top.equalTo(imageView)
            $0.leading.equalTo(imageView).offset(6)
        }
        self.accessoryView2.snp.makeConstraints {
            $0.height.equalTo(imageView).offset(-1)
            $0.width.equalTo(3)
            $0.top.equalTo(imageView)
            $0.leading.equalTo(imageView)
        }
    }
    
}
