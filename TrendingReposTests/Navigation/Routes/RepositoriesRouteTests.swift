//
//  RepositoriesRouteTests.swift
//  TrendingReposTests
//
//  Created by Enrique Bermúdez on 6/15/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

import XCTest
@testable import TrendingRepos

class RepositoriesRouteTests: XCTestCase {

    func testShowError() {
        
        let showErrorRoute: RepositoriesRoute = .show(error: FakeError())
        
        if let transiton = showErrorRoute.getTransition() as? NavigationTransition {
            if case NavigationTransition.NavigationType.present = transiton.type {
                return
            }
        }
    
        XCTFail("Show error route is not returning the right transition")
    }
}
