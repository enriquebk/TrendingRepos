//
//  DataSourceMock.swift
//  TrendingReposTests
//
//  Created by Enrique Bermúdez on 6/15/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

import Foundation
import RxSwift
@testable import TrendingRepos

class DataSourceMock: DataSource {
    
    public var from: Date? 
    public var pageIndex: UInt = 0
    
    func fetch(from date: Date, pageIndex: UInt) -> Observable<RepositoriesPage> {
        self.from = date
        self.pageIndex = pageIndex
        return Observable.empty()
    }
}
