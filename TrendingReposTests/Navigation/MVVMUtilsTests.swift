//
//  MVVMCUtilsTests.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/12/19.
//  Copyright © 2019 Enrique Bermudez. All rights reserved.
//

import XCTest
@testable import TrendingRepos

class MVVMUtilsTests: XCTestCase {

    func testMVVMCInstantiateMethod() {
        let viewController = FakeViewController.instantiate(with: FakeViewModelNavigationManager())
        XCTAssertNotNil(viewController.viewModel)
        XCTAssertNotNil(viewController.viewModel.navigator)
    }
}
