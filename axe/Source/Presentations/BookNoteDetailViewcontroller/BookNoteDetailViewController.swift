//
//  BookNoteDetailViewController.swift
//  axe
//
//  Created by 조선미 on 2021/03/17.
//

import UIKit

class BookNoteDetailViewController: UIViewController {
    
    private lazy var tableView = UITableView()
    private lazy var tableHeader = BookNoteDetailHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.attribute()
        self.layout()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.tableView.tableHeaderView?.layoutIfNeeded()
        self.tableView.tableHeaderView = self.tableView.tableHeaderView
    }
    
    private func attribute() {
        self.view.backgroundColor = .white
        self.tableView.tableHeaderView = self.tableHeader
        self.tableView.separatorStyle = .none
    }
    
    private func layout() {
        self.view.addSubview(tableView)
        
        self.tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeArea.top)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeArea.bottom)
        }
        
    }

}
