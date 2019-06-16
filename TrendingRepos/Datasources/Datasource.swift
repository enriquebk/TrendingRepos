//
//  Datasource.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/15/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

import Foundation
import RxSwift

protocol DataSource {
    func fetch(from: Date, page: UInt) -> Observable<RepositoriesPage>
}
