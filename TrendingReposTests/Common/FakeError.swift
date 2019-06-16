//
//  FakeError.swift
//  TrendingReposTests
//
//  Created by Enrique Bermúdez on 6/15/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

struct FakeError: Error, Equatable {
    public var errorDescription: String? {
        return "Fake Error"
    }
}
