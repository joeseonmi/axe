//
//  BookNoteDetailViewController.swift
//  axe
//
//  Created by 조선미 on 2021/03/17.
//

import UIKit
import RxCocoa
import RxSwift

class BookNoteDetailViewController: AxeViewController {
    
    private lazy var tableView = UITableView()
    private lazy var tableHeader = BookNoteDetailHeaderView()
    private var bag = DisposeBag()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.attribute()
        self.layout()
        self.bind()
    }
    
    func bind() {
        
        let test: [Content] = [
            Content(type: .impressions, title: "안녕하십니까", content: "직장인은 통제력이 없기때문에 자기 재무관련 결정에 대한 통제력이 없다.그러므로 직장이란것은 한심하다. 연봉이 올랐으면, 회사가 망하지 않았으면 하는 생각들은 전부 ‘희망’ 인 것이고 내가 통제할 수 없는 것들이기 때문이다."),
            Content(type: .impressions, title: "안녕하십니까", content: "직장인은 통제력이 없기때문에 자기 재무관련 결정에 대한 통제력이 없다.그러므로 직장이란것은 한심하다. 연봉이 올랐으면, 회사가 망하지 않았으면 하는 생각들은 전부 ‘희망’ 인 것이고 내가 통제할 수 없는 것들이기 때문이다.직장인은 통제력이 없기때문에 자기 재무관련 결정에 대한 통제력이 없다.그러므로 직장이란것은 한심하다. 연봉이 올랐으면, 회사가 망하지 않았으면 하는 생각들은 전부 ‘희망’ 인 것이고 내가 통제할 수 없는 것들이기 때문이다."),
            Content(type: .impressions, title: "안녕하십니까", content: "직장인은 통제력이 없기때문에 자기 재무관련 결정에 대한 통제력이 없다.그러므로 직장이란것은 한심하다. 연봉이 올랐으면, 회사가 망하지 않았으면 하는 생각들은 전부 ‘희망’ 인 것이고 내가 통제할 수 없는 것들이기 때문이다.직장인은 통제력이 없기때문에 자기 재무관련 결정에 대한 통제력이 없다.그러므로 직장이란것은 한심하다. 연봉이 올랐으면, 회사가 망하지 않았으면 하는 생각들은 전부 ‘희망’ 인 것이고 내가 통제할 수 없는 것들이기 때문이다.직장인은 통제력이 없기때문에 자기 재무관련 결정에 대한 통제력이 없다.그러므로 직장이란것은 한심하다. 연봉이 올랐으면, 회사가 망하지 않았으면 하는 생각들은 전부 ‘희망’ 인 것이고 내가 통제할 수 없는 것들이기 때문이다."),
            Content(type: .impressions, title: "안녕하십니까안녕하십니까안녕하십니까안녕하십니까안녕하십니까안녕하십니까안녕하십니까안녕하십니까안녕하십니까안녕하십니까안녕하십니까안녕하십니까", content: "직장인은 통제력이 없기때문에 자기 재무관련 결정에 대한 통제력이 없다.그러므로 직장이란것은 한심하다. 연봉이 올랐으면, 회사가 망하지 않았으면 하는 생각들은 전부 ‘희망’ 인 것이고 내가 통제할 수 없는 것들이기 때문이다."),
            Content(type: .impressions, title: "안녕하십니까", content: "직장인은 통제력이 없기때문에 자기 재무관련 결정에 대한 통제력이 없다.그러므로 직장이란것은 한심하다. 연봉이 올랐으면, 회사가 망하지 않았으면 하는 생각들은 전부 ‘희망’ 인 것이고 내가 통제할 수 없는 것들이기 때문이다.")
        ]
        
        let testob = Observable.of(test).asDriver(onErrorDriveWith: .empty())
        
        testob.drive(self.tableView.rx.items) { tv, row, contents in
            let indexPath = IndexPath(row: row, section: 0)
            let cell = tv.dequeueReusableCell(withIdentifier: String(describing: BookNoteCell.self), for: indexPath) as! BookNoteCell
            cell.configureCell(note: contents)
            return cell
        }.disposed(by: self.bag)
        
        self.tableView.rx.contentOffset
            .subscribe(onNext: { point in
                
            })
            .disposed(by: self.bag)
        
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
        self.tableView.register(BookNoteCell.self,
                                forCellReuseIdentifier: String(describing: BookNoteCell.self))
        self.tableView.backgroundColor = .white
    }
    
    private func layout() {
        self.view.addSubview(tableView)
        
        self.tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeArea.top)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeArea.bottom)
        }
        
        self.tableHeader.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
    }

}
