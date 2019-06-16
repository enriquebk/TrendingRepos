//
//  GetMostStaredRepositoriesUseCaseMock.swift
//  TrendingReposTests
//
//  Created by Enrique Bermúdez on 6/15/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

import Foundation
import RxSwift
@testable import TrendingRepos

class GetMostStaredRepositoriesUseCaseMock: GetMostStaredRepositoriesUseCase {
    
    var shouldFail = false
    var fetchedPage: UInt?
    
    static let repositoriesResult = [Repository(name: "Name",
                                          description: "Description",
                                          starsCount: 30,
                                          owner: Owner(name: "Owner name",
                                                       avatarURL: "http://www.google.com")),
                               Repository(name: "Name 2",
                                          description: "Description 2",
                                          starsCount: 31,
                                          owner: Owner(name: "Owner name 2",
                                                       avatarURL: "http://www.google.com"))]
    
    override func fetchPage(at pageIndex: UInt) -> Observable<RepositoriesPage> {
        
        self.fetchedPage = pageIndex
        
        guard shouldFail == false else {
            return Observable.error(FakeError())
        }
        
        return Observable.just(RepositoriesPage(pageIndex: pageIndex,
                                                repositories: GetMostStaredRepositoriesUseCaseMock.repositoriesResult))
    }
    
}
