//
//  FetchRepositoriesUseCase.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/15/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

import Foundation
import RxSwift

class GetMostStaredRepositoriesUseCase {
    
    private let remoteDataSource: DataSource
    private let fromDate: Date
    
    init(_ remoteDataSource: DataSource = RemoteDataSource(),
         fromDate date: Date = .thirtyDaysBeforeToday) {
        self.remoteDataSource = remoteDataSource
        self.fromDate = date
    }
    
    func fetchPage(at pageIndex: UInt) -> Observable<RepositoriesPage> {
        return self.remoteDataSource
            .fetch(from: fromDate,
                   pageIndex: pageIndex)
    }
}
