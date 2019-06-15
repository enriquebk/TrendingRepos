//
//  RemoteDataSource.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/15/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

import Foundation
import RxSwift

class RemoteDataSource: DataSource {
    
    func fetch(from: Date, page: Int) -> Observable<RepositoriesPage> {
        
        return APIClient()
            .searchRepositoriesByStars(from: from, page: page)
            .map({
            RepositoriesPage(pageIndex: page,
                             repositories: $0.repositories.toModel)
        })
    }
}

extension Array where Element == APIRepository {
    var toModel: [Repository] {
        return self.map({
            return Repository(name: $0.name,
                       description: $0.description,
                       starsCount: $0.starsCount,
                       owner: Owner(name: $0.owner.name,
                                    avatarURL: $0.owner.avatarURL))
        })
    }
}
