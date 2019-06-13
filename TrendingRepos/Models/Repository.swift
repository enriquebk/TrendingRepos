//
//  Repository.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/12/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

struct Repository: Codable, Equatable {
    
    let name: String
    let description: String?
    let starsCount: Int
    let owner: Owner
    
    enum CodingKeys: String, CodingKey {
        case name, starsCount = "stargazers_count", description, owner
    }
}
