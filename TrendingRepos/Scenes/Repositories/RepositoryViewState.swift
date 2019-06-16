//
//  RepositoryViewState.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/15/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

struct RepositoryViewState {
    
    let repositoryName: String
    let starsCountString: String
    let ownerName: String
    let repositoryDescription: String
    private let ownerAvatarURL: String
    
    init(_ repository: Repository) {
        self.repositoryName = repository.name
        self.starsCountString = repository.starsCount.abbreviated
        self.ownerName = repository.name
        self.ownerAvatarURL = repository.owner.avatarURL
        self.repositoryDescription = repository.description ?? ""
    }
    
    func loadAndDisplayAvatar(on imageView: UIImageView) {
        
        guard let url = URL(string: self.ownerAvatarURL) else {
            imageView.image = Asset.placeHolder.image
            return
        }
        
        imageView.kf.setImage(
            with: url,
            placeholder: Asset.placeHolder.image)
    }
}
