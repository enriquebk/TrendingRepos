//
//  RepositoryListRoute.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/14/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

import Foundation

enum RepositoriesRoute: Route {
    func getTransition() -> Transition {
        return NavigationTransition(.noTransition)
    }
}
