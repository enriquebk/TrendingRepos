//
//  NetworkError.swift
//  TrendingRepos
//
//  Created by Enrique Bermúdez on 6/13/19.
//  Copyright © 2019 Enrique Bermúdez. All rights reserved.
//

import Foundation

public enum NetworkError: LocalizedError {
    
    case invalidRequest
    case unknownError
    
    public var errorDescription: String? {
        switch self {
        case .invalidRequest: return "Invalid request"
        case .unknownError: return "Unknown Error"
        }
    }
}
