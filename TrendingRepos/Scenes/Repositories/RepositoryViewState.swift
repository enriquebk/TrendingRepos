//
//  RepositoryViewState.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/15/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

import Foundation

struct RepositoryViewState {
    
    let repositoryName: String
    let starsCountString: String
    let ownerName: String
    let ownerAvatarURL: String
    let repositoryDescription: String
    
    init(_ repository: Repository) {
        self.repositoryName = repository.name
        self.starsCountString = "\(repository.starsCount)"
        self.ownerName = repository.name
        self.ownerAvatarURL = repository.owner.avatarURL
        self.repositoryDescription = repository.description ?? ""
    }
}
