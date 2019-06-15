//
//  GitHubRepository.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/15/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

struct APIRepository: Codable, Equatable {
    
    let name: String
    let description: String?
    let starsCount: Int
    let owner: APIOwner
    
    enum CodingKeys: String, CodingKey {
        case name, starsCount = "stargazers_count", description, owner
    }
}
