//
//  MVVMUtils.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/12/19.
//  Copyright © 2019 Enrique Bermudez. All rights reserved.
//

import UIKit

public extension MVVMView where Self: UIViewController, Self.ViewModelType: NavigatorManager {
    
    static func instantiate(with viewModel: Self.ViewModelType) -> Self {
        
        let viewController = Self()
        viewController.bind(to: viewModel)
        viewController.viewModel.navigator = Navigator<Self.ViewModelType.CoordinatorType>(root: viewController)
        
        return viewController
    }
}
