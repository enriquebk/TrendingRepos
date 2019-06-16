//
//  RepositoryViewStateTests.swift
//  TrendingReposTests
//
//  Created by Enrique Bermúdez on 6/15/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

import XCTest
@testable import TrendingRepos

class RepositoryViewStateTests: XCTestCase {

    func testRepositoryViewStateInit() {
        
        let testRepository = Repository(name: "Name",
                    description: "Description",
                    starsCount: 3000,
                    owner: Owner(name: "Owner name",
                                 avatarURL: "http://www.google.com"))
        let viewState = RepositoryViewState(testRepository)
        
        XCTAssertEqual(viewState.repositoryName, testRepository.name)
        XCTAssertEqual(viewState.repositoryDescription, testRepository.description)
        XCTAssertEqual(viewState.starsCountString, "3K")
        XCTAssertEqual(viewState.ownerName, testRepository.owner.name)
        
    }
}
