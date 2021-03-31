//
//  BookNoteListViewController.swift
//  axe
//
//  Created by 조선미 on 2021/03/20.
//

import UIKit

class BookNoteListViewController: UIViewController {
    
    private var collectionView = UICollectionView(frame: .zero,
                                                  collectionViewLayout: UICollectionViewLayout())
    private var flowLayout = UICollectionViewFlowLayout()
    private var headerView = BookNoteDetailHeaderView()
    
    private var dataSource: [[String: String]] = [["title": "7년의 밤7년의 밤7년의 밤7년의 밤7년의 밤7년의 밤7년의 밤", "info": "갯수 0  |  별점 4.5"],
                                                  ["title": "7년의 밤", "info": "갯수 0  |  별점 4.5"],
                                                  ["title": "7년의 밤", "info": "갯수 0  |  별점 4.5"],
                                                  ["title": "7년의 밤", "info": "갯수 0  |  별점 4.5"],
                                                  ["title": "7년의 밤", "info": "갯수 0  |  별점 4.5"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
    }
    
    func attribute() {
        self.view.backgroundColor = .white
        self.flowLayout = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView(frame: .zero,
                                               collectionViewLayout: self.flowLayout)
        self.collectionView.register(BookNoteListCell.self,
                                     forCellWithReuseIdentifier: String(describing: BookNoteListCell.self))
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.flowLayout.scrollDirection = .vertical
        self.flowLayout.minimumLineSpacing = 15
        self.flowLayout.minimumInteritemSpacing = 10
        self.flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 13, bottom: 20, right: 13)
        self.collectionView.backgroundColor = .white
    }
    
    func layout() {
        self.view.addSubview(collectionView)
        self.collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeArea.top)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeArea.bottom)
        }
    }
    
}

extension BookNoteListViewController: UICollectionViewDelegateFlowLayout,
                                      UICollectionViewDataSource,
                                      UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: BookNoteListCell.self), for: indexPath) as! BookNoteListCell
        cell.configureCell(data: dataSource[indexPath.item])
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 40) / 2
        return CGSize(width: width, height: width + 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = BookNoteDetailViewController()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
