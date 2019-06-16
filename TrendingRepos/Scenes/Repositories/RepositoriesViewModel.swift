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
    
    var navigator: Navigator<RepositoriesRoute>!
    private let getMostStaredRepositoriesUseCase: GetMostStaredRepositoriesUseCase
    
    private var loadedPages: [RepositoriesPage] = [] {
        didSet {
            self.repositoriesSubject.onNext(self.loadedPages.flatMap({$0.repositories}))
        }
    }
    
    private var repositoriesSubject = BehaviorSubject<[Repository]>(value: [])
    
    init(useCase: GetMostStaredRepositoriesUseCase = GetMostStaredRepositoriesUseCase()) {
        self.getMostStaredRepositoriesUseCase = useCase
    }
    
    var screenName: Observable<String> {
        return Observable.just(L10n.title)
    }
    
    var repositories: Observable<[Repository]> {
        return repositoriesSubject
    }
    
    func loadFirstPage() -> Completable {
        return loadPage(pageIndex: 0)
    }
    
    func loadPageForRepositories(at indexPaths: [IndexPath]) -> Completable {
        
        let loadedItems = self.loadedPages.flatMap({$0.repositories}).count
        let needsToLoadNewPage = indexPaths.first(where: {
            return $0.item >= loadedItems - 1 
        }) != nil
        
        if needsToLoadNewPage {
            let pageIndex:UInt = self.loadedPages.last != nil ? 0 : (self.loadedPages.last?.pageIndex ?? 0 + 1)
            
            return self.loadPage(pageIndex: pageIndex)
        }
        return Completable.empty()
    }
    
    private func loadPage(pageIndex: UInt) -> Completable {
        
        return Completable.create { [weak self] completable -> Disposable in
            
            guard let strongSelf = self else { return Disposables.create() }
            
            return strongSelf.getMostStaredRepositoriesUseCase.fetchPage(at: pageIndex).subscribe(onNext: { page in
                if pageIndex == 0 {
                    self?.loadedPages = [page]
                } else {
                    self?.loadedPages.append(page)
                }
            }, onError: { error in
                self?.navigator.navigate(to: .show(error: error))
                completable(.error((error)))
            }, onCompleted: {
                completable(.completed)
            })
        }
    }
}
