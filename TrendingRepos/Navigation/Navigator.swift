//
//  Navigator.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/12/19.
//  Copyright © 2019 Enrique Bermudez. All rights reserved.
//

import UIKit

public protocol Presentable { }

extension UIViewController: Presentable {}

public class Navigator<NavigatorRoute: Route> {
    
    public var root: Presentable!

    init(root: Presentable) {
        self.root = root
    }

    public func navigate(to destination: NavigatorRoute) {
        let transition = destination.getTransition()
        transition.execute(from: self.root)
    }
}

public protocol NavigatorManager {
    
    associatedtype CoordinatorType: Route

    var navigator: Navigator<CoordinatorType>! { get set }
}
