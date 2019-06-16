//
//  Transition.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/12/19.
//  Copyright © 2019 Enrique Bermudez. All rights reserved.
//

import UIKit

public protocol Transition {
    
    func execute(from: Presentable)
}

public class NavigationTransition: Transition {
    
    public enum NavigationType {
        case push(UIViewController)
        case present(UIViewController)
        case pop
        case popToRoot
        case dismiss
        case noTransition
    }
    
    public var type: NavigationType
    
    public init(_ transition: NavigationType) {
        type = transition
    }
    
    public func execute(from presentable: Presentable) {
        
        guard let sourceVC = presentable as? UIViewController else {
            return
        }
        
        switch self.type {
            
        case let .push(destination):
            sourceVC.navigationController?.pushViewController(destination, animated: true)
            
        case let .present(destination):
            sourceVC.navigationController?.present(destination, animated: true)
            
        case .dismiss:
            sourceVC.dismiss(animated: true, completion: nil)
            
        case .pop:
            sourceVC.navigationController?.popViewController(animated: true)
            
        case .popToRoot:
            sourceVC.navigationController?.popToRootViewController(animated: true)
            
        case .noTransition: break
            
        }
    }
}
