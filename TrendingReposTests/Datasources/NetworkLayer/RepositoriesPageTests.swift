//
//  RepositoriesPageTests.swift
//  TrendingReposTests
//
//  Created by Enrique Bermúdez on 6/13/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

import XCTest
@testable import TrendingRepos

class RepositoriesPageTests: XCTestCase {

    func testParseRepositoriesPage() {
        
        if let jsonData = testJsonData {
            let page = try? JSONDecoder().decode(APIRepositoriesPage.self, from: jsonData)
            XCTAssertEqual(page, expectedResult)
        } else {
            XCTFail("Error while parsing RepositoriesPage")
        }
    }

}

// swiftlint:disable line_length
extension RepositoriesPageTests {
    
    private var expectedResult: APIRepositoriesPage {
        return APIRepositoriesPage(repositories: [APIRepository(name: "FindCrypt-Ghidra",
                                                   description: "IDA Pro's FindCrypt ported to Ghidra, with an updated and customizable signature database",
                                                   starsCount: 186,
                                                   owner: APIOwner(name: "d3v1l401",
                                                                avatarURL: "https://avatars2.githubusercontent.com/u/7295314?v=4"))])
    }
    
    private var testJsonData: Data? { return """
{
  "items": [
    {
      "name": "FindCrypt-Ghidra",
      "owner": {
        "login": "d3v1l401",
        "avatar_url": "https://avatars2.githubusercontent.com/u/7295314?v=4",
      },
      "description": "IDA Pro's FindCrypt ported to Ghidra, with an updated and customizable signature database",
        "stargazers_count": 186
    }]
}
""".data(using: .utf8)
        
    }
}
// swiftlint:enable line_length
