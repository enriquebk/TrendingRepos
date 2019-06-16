//
//  Repository.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/12/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

struct Repository: Equatable {
    
    let name: String
    let description: String?
    let starsCount: Int
    let owner: Owner
}
