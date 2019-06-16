//
//  RepositoryTableViewCellTests.swift
//  TrendingReposTests
//
//  Created by Enrique Bermúdez on 6/15/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import TrendingRepos

class RepositoriesViewControllerTests: FBSnapshotTestCase {

    func testRepositoriesViewControllerLayout() {

        let viewModel = RepositoriesViewModel(useCase:
            GetMostStaredRepositoriesUseCaseMock())
        let repositoriesViewController = RepositoriesViewController.instantiate(with: viewModel)
        FBSnapshotVerifyView(repositoriesViewController.view)
    }
}
