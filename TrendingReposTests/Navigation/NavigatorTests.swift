//
//  NavigatorTests.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/12/19.
//  Copyright © 2019 Enrique Bermudez. All rights reserved.
//

import XCTest
@testable import TrendingRepos

class NavigatorTests: XCTestCase {

    private var root: UIViewController!
    private var navigator: Navigator<RouteMock>!
    
    override func setUp() {
        root = UIViewController()
        navigator = Navigator<RouteMock>.init(root: root)
    }
    
    func testNavigatorInit() {

        if let navigatorRoot = navigator.root as? UIViewController {
            XCTAssertTrue(navigatorRoot === root)
        } else {
            XCTFail("Navigator root was't correclty initialized")
        }
    }
    
    func testNavigate() {

        let routeMock = RouteMock()
        
        navigator.navigate(to: routeMock)
        
        XCTAssertTrue(routeMock.didCallGetTransition)
    
        if let transition = routeMock.returnedTransition,
            let from = transition.from as? UIViewController {
            XCTAssertTrue(from === root)
        } else {
            XCTFail("An error has occurred when accessing `returnedTransition`")
        }
    }
}
