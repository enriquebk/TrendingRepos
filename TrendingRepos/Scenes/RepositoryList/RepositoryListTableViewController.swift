//
//  RepositoryListTableViewController.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/12/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

import UIKit

class RepositoryListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = L10n.trendingRepos
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 0
    }
}
