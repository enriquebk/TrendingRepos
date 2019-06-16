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
    public var page: UInt = 0
    
    func fetch(from date: Date, page: UInt) -> Observable<RepositoriesPage> {
        self.from = date
        self.page = page
        return Observable.empty()
    }
}
