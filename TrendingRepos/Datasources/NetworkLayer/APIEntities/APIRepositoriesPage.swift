//
//  RepositoriesPage.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/13/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

import Foundation

struct APIRepositoriesPage: Codable, Equatable {
    let repositories: [APIRepository]
    
    enum CodingKeys: String, CodingKey {
        case repositories = "items"
    }
}
