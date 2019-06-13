//
//  APIRequestTests.swift
//  TrendingReposTests
//
//  Created by Enrique Bermúdez on 6/13/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

import XCTest
@testable import TrendingRepos

class APIRequestTests: XCTestCase {

    func testSearchRepositoriesByStars() {
        
        let isoDate = "2019-06-01T10:00:00+0000"
        let dateFormatter = ISO8601DateFormatter()
        // swiftlint:disable line_length
        let optionalTestUrl = URL(string: "https://api.github.com/search/repositories?sort=stars&page=10&q=created:%3E2019-06-01&order=desc")
        // swiftlint:enable line_length
        
        guard let testDate = dateFormatter.date(from: isoDate),
            let testUrl = optionalTestUrl,
            let testURLComponents = URLComponents(url: testUrl, resolvingAgainstBaseURL: false)
        else {
            XCTFail("Error while creating test data")
            return
        }
        
        if let request = APIRequest.searchRepositoriesByStars(page: 10, fromDate: testDate).request,
            let url = request.url,
            let urlComponets = URLComponents(url: url, resolvingAgainstBaseURL: false) {
            
            XCTAssertEqual(urlComponets.host, testURLComponents.host)
            XCTAssertEqual(urlComponets.scheme, testURLComponents.scheme)
            XCTAssertEqual(urlComponets.path, testURLComponents.path)
            
            if let queryItems = urlComponets.queryItems, let testQueryItems = testURLComponents.queryItems {
                XCTAssertEqual(Set(queryItems), Set(testQueryItems))
            } else {
                XCTFail("Unable to compare url query portion")
            }
            
        } else {
            XCTFail("Unable to create `searchRepositoriesByStars` request")
        }
    }
}
