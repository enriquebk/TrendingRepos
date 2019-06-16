//
//  RepositoriesViewModelTests.swift
//  TrendingReposTests
//
//  Created by Enrique Bermúdez on 6/15/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

import XCTest
import RxSwift
@testable import TrendingRepos

class RepositoriesViewModelTests: XCTestCase {

    private let disposeBag = DisposeBag()
    private var useCaseMock = GetMostStaredRepositoriesUseCaseMock()
    private var viewModel = RepositoriesViewModel()
    private var navigator = RepositoriesNavigatorMock()
    
    override func setUp() {
        useCaseMock = GetMostStaredRepositoriesUseCaseMock()
        viewModel = RepositoriesViewModel(useCase: useCaseMock)
        navigator = RepositoriesNavigatorMock()
        viewModel.navigator = navigator
    }
    
    func testScreenName() {
        
        viewModel.screenName.subscribe(onNext: { name in
            XCTAssertEqual(name, L10n.title)
        }).disposed(by: disposeBag)
    }

    func testLoadPageForRepositoriesWithError() {
        useCaseMock.shouldFail = true
        
        let shouldTriggerError = self.expectation(description: "Should triggerError")
        
        viewModel.loadPageForRepositories(at: [IndexPath.init(item: 1, section: 0)])
            .subscribe(onError: { [weak self] error in
                
                XCTAssertTrue(error is FakeError)
                
                guard let navigation = self?.navigator.navigation else {
                    XCTFail("ViewModel didn't show error message")
                    return
                }
                
                if case RepositoriesRoute.show = navigation {
                    shouldTriggerError.fulfill()
                } else {
                    XCTFail("ViewModel performed the wrong navigation")
                }

            })
            .disposed(by: disposeBag)
        
        wait(for: [shouldTriggerError], timeout: 1)
    }
    
    func testLoadPageForRepositories() {
        
        let shouldLoadRepositoriesExpectation = self.expectation(description: "Should load new repositories")
        
        viewModel.repositories.subscribe(onNext: { repositories in
                if repositories.count > 0 {
                    XCTAssertEqual(GetMostStaredRepositoriesUseCaseMock.repositoriesResult,
                               repositories)
                    shouldLoadRepositoriesExpectation.fulfill()
                }
            }).disposed(by: disposeBag)
    
        viewModel.loadPageForRepositories(at: [IndexPath.init(item: 1, section: 0)])
            .subscribe()
            .disposed(by: disposeBag)
        
        wait(for: [shouldLoadRepositoriesExpectation], timeout: 1)
    }

    func testloadFirstPage() {
       
        let shouldLoadRepositoriesExpectation = self.expectation(description: "Should load new repositories")
        
        viewModel.repositories.subscribe(onNext: { [weak self] repositories in
            if repositories.count > 0 {
                XCTAssertEqual(GetMostStaredRepositoriesUseCaseMock.repositoriesResult,
                               repositories)
                XCTAssertTrue(self?.useCaseMock.fetchedPage == 0)
                shouldLoadRepositoriesExpectation.fulfill()
            }
        }).disposed(by: disposeBag)
        
        viewModel.loadFirstPage()
            .subscribe()
            .disposed(by: disposeBag)
        
        wait(for: [shouldLoadRepositoriesExpectation], timeout: 1)
    }
}
