//
//  MainNavigationController.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/12/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    init() {
        let root = RepositoriesViewController.instantiate(with: RepositoriesViewModel())
        super.init(rootViewController: root)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
}
