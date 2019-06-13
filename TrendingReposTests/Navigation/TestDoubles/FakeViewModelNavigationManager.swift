//
//  FakeViewModelNavigationManager.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/12/19.
//  Copyright © 2019 Enrique Bermudez. All rights reserved.
//

import UIKit
@testable import TrendingRepos

class FakeRoute: Route {
    func getTransition() -> Transition {
        return NavigationTransition(.noTransition)
    }
}

class FakeViewModelNavigationManager: ViewModel, NavigationManager {
    
    var navigator: Navigator<FakeRoute>!
}

class FakeViewController: UIViewController, MVVMView {
    var viewModel: FakeViewModelNavigationManager!
    
    func bindViewModel() { }
}
