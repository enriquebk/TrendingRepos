//
//  TransitionMock.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/12/19.
//  Copyright © 2019 Enrique Bermudez. All rights reserved.
//

@testable import TrendingRepos

class TransitionMock: Transition {
    
    var from: Presentable?
    
    func execute(from presentable: Presentable) {
        from = presentable
    }
}
