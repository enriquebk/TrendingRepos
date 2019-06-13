//
//  MVVMViewTests.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/12/19.
//  Copyright © 2019 Enrique Bermudez. All rights reserved.
//

import XCTest
@testable import TrendingRepos

class MVVMViewTests: XCTestCase {

    private let fakeViewModel = FakeViewModel()
    
    func testUIViewBinding() {
       
        let view = ViewMVVMViewMock()
        
        view.bind(to: fakeViewModel)
        
        XCTAssertTrue(view.didCallBindViewModel)
        XCTAssertNotNil(view.viewModel)
    }
    
    func testUIViewControllerBinding() {
        
        let viewController = ViewControllerMVVMViewMock()

        viewController.bind(to: fakeViewModel)
        
        XCTAssertTrue(viewController.didCallBindViewModel)
        XCTAssertTrue(viewController.didCallViewDidLoad)
        XCTAssertNotNil(viewController.viewModel)
    }
}
