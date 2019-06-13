//
//  MVVMView.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/12/19.
//  Copyright © 2019 Enrique Bermudez. All rights reserved.
//

import UIKit

public protocol MVVMView: AnyObject {
    
    associatedtype ViewModelType: ViewModel

    var viewModel: ViewModelType! { get set }
    
    func bindViewModel()
}

public extension MVVMView where Self: UIViewController {
    
    func bind(to viewModel: Self.ViewModelType) {
        self.viewModel = viewModel
        loadViewIfNeeded()
        bindViewModel()
    }
}

public extension MVVMView where Self: UIView {
    
    func bind(to viewModel: Self.ViewModelType) {
        self.viewModel = viewModel
        bindViewModel()
    }
}
