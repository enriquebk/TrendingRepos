//
//  NavigatorMock.swift
//  TrendingReposTests
//
//  Created by Enrique Bermúdez on 6/15/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

import Foundation
import RxSwift
@testable import TrendingRepos

class RepositoriesNavigatorMock: Navigator<RepositoriesRoute> {
    
    public var navigation:RepositoriesRoute?
    
    init() {
        super.init(root: UIViewController())
    }
    
    override func navigate(to destination: RepositoriesRoute) {
        if case RepositoriesRoute.show = destination {
            navigation = destination
        }
    }
}
