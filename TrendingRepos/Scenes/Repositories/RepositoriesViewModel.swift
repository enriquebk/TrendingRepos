//
//  RepositoriesViewModel.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/14/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

import Foundation
import RxSwift

class RepositoriesViewModel: ViewModel, NavigationManager {
    
    private var currentPage: Int = 0
    var navigator: Navigator<RepositoriesRoute>!
    
    var screenName: Observable<String> {
        return Observable.just(L10n.trendingRepos)
    }
    
    private var repositoriesSubject = BehaviorSubject<[Repository]>(value: [])
    
    var repositories: Observable<[Repository]> {
        return repositoriesSubject
    }
    
    func loadFirstPage() {

    }
    
    func loadPageForRepositories(at idexPaths: [IndexPath]) {
        
    }
}
