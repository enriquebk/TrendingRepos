//
//  NetworkErrorTests.swift
//  TrendingReposTests
//
//  Created by Enrique Bermúdez on 6/13/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

import XCTest
@testable import TrendingRepos

class NetworkErrorTests: XCTestCase {

     func testLocalizedDescription() {
        
        XCTAssertEqual(NetworkError.invalidRequest.localizedDescription, "Invalid request")
        XCTAssertEqual(NetworkError.unknownError.localizedDescription, "Unknown Error")
    }
}
