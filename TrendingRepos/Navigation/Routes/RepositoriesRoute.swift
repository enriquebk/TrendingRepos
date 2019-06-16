//
//  RepositoryListRoute.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/14/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

import Foundation
import UIKit

enum RepositoriesRoute: Route {
    
    case show(error:Error)
    
    func getTransition() -> Transition {
        
        switch self {
        case .show(error: let error):
            
            let alert = UIAlertController(title: L10n.error,
                                          message: error.localizedDescription,
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: L10n.ok, style: .cancel))
        
            return NavigationTransition(.present(alert))
        }
    }
}
