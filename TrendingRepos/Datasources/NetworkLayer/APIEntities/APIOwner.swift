//
//  GitHubOwner.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/15/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

struct APIOwner: Codable, Equatable {
    let name: String
    let avatarURL: String
    
    enum CodingKeys: String, CodingKey {
        case name = "login", avatarURL = "avatar_url"
    }
}
