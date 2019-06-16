//
//  GetMostStaredRepositoriesUseCaseTest.swift
//  TrendingReposTests
//
//  Created by Enrique Bermúdez on 6/15/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

import XCTest
import RxSwift
@testable import TrendingRepos

class GetMostStaredRepositoriesUseCaseTest: XCTestCase {

    private let disposeBag = DisposeBag()
    private let dataSourceSpy = DataSourceMock()
    
    func testSetFetchPage() {
        let fromDate = Date()
        let pageToFetch: UInt = 3
        
        let useCase = GetMostStaredRepositoriesUseCase(dataSourceSpy, fromDate: fromDate)

        let expectation = self.expectation(description: "")
        
         useCase.fetchPage(at: pageToFetch)
            .subscribe(
                onCompleted: { [weak self] in
                    guard let strongSelf = self else { return }
                    XCTAssertTrue(fromDate == strongSelf.dataSourceSpy.from)
                    XCTAssertTrue(pageToFetch == strongSelf.dataSourceSpy.pageIndex)
                    expectation.fulfill()
            }).disposed(by: disposeBag)
        
        wait(for: [expectation], timeout: 1)
    }
}
