//
//  RepositoriesViewController.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/12/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RepositoriesViewController: UIViewController, MVVMView {

    private let disposeBag = DisposeBag()
    private let refreshControl = UIRefreshControl()
    var viewModel: RepositoriesViewModel!
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.addSubview(self.refreshControl)
        self.refreshControl.addTarget(self, action: #selector(reloadTableView), for: .valueChanged)
        self.reloadTableView()
    }
    
    func bindViewModel() {
        
        self.viewModel.screenName.bind { [weak self] name in
            self?.title = name
        }.disposed(by: disposeBag)
        
        self.tableView.registerCell(type: RepositoryTableViewCell.self)
        viewModel.repositories.bind(to:
                tableView
                .rx
                .items(cellIdentifier: RepositoryTableViewCell.nibIdentifier,
                    cellType: RepositoryTableViewCell.self)) { (_, repo: Repository, cell: RepositoryTableViewCell) in
                        cell.configue(with: RepositoryViewState(repo))
            }
            .disposed(by: disposeBag)
        
        tableView
            .rx
            .prefetchRows
            .subscribe(onNext: { [weak self] indexPaths in
            self?.loadRepositories(at: indexPaths)
        }).disposed(by: disposeBag)
    }
    
    @objc func reloadTableView() {
        
        self.refreshControl.beginRefreshing()
        self.viewModel.loadFirstPage()
            .observeOn(MainScheduler.instance)
            .subscribe(onCompleted: { [weak self] in
            self?.refreshControl.endRefreshing()
        }).disposed(by: self.disposeBag)
    }
    
    func loadRepositories(at indexPaths: [IndexPath]) {
        self.viewModel.loadPageForRepositories(at: indexPaths)
            .subscribe()
            .disposed(by: self.disposeBag)
    }
}
