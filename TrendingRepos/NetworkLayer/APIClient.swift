//
//  APIClient.swift
//  iOS-Demo
//
//  Created by Enrique Bermúdez on 2/1/19.
//  Copyright © 2019 Enrique Bermudez. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class APIClient: NSObject {
    
    private func execute(request apiRequest: APIRequest) -> Observable<Data> {
        guard let request = apiRequest.request else {
            return Observable.error(NetworkError.invalidRequest)
        }
        
        return URLSession.shared.rx.data(request: request)
    }
    
    func searchRepositoriesByStars(from date: Date, page:Int) -> Observable<[Repository]> {
            
            return self.execute(request: .searchRepositoriesByStars(page: page, fromDate:date)).map({
                do {
                    let page =  try JSONDecoder().decode(RepositoriesPage.self, from: $0)
                    return page.repositories
                } catch {
                    throw error
                }
            })
    }
}
