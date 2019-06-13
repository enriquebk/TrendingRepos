//
//  Owner.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/12/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

struct Owner: Codable, Equatable {
    let name: String
    let avatarURL: String
    
    enum CodingKeys: String, CodingKey {
        case name = "login", avatarURL = "avatar_url"
    }
}
