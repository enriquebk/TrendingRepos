//
//  RepositoryTableViewCell.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/14/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {
    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var repositoryDescription: UILabel!
    @IBOutlet weak var ownerAvatarImageView: UIImageView!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var starCountLabel: UILabel!
    
    func configue(with viewState: RepositoryViewState) {
        self.repositoryNameLabel.text = viewState.repositoryName
        self.repositoryDescription.text = viewState.repositoryDescription
        self.ownerNameLabel.text = viewState.ownerName
        self.starCountLabel.text = viewState.starsCountString
        self.ownerAvatarImageView.image = Asset.placeHolder.image
        //TODO: fetch avatarURL
    }
    
}
