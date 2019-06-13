//
//  RouteMock.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/12/19.
//  Copyright © 2019 Enrique Bermudez. All rights reserved.
//

@testable import TrendingRepos

class RouteMock: Route {
    var didCallGetTransition = false
    var returnedTransition: TransitionMock?
    
    func getTransition() -> Transition {
        didCallGetTransition = true
        let transition = TransitionMock()
        returnedTransition = transition
        return transition
    }
}
