//
//  RepositoriesPage.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/15/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

import Foundation

struct RepositoriesPage: Equatable {
    let pageIndex: UInt
    let repositories: [Repository]
}
