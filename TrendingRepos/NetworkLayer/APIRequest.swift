//
//  APIRoute.swift
//  iOS-Demo
//
//  Created by Enrique Bermúdez on 2/1/19.
//  Copyright © 2019 Enrique Bermudez. All rights reserved.
//

import Foundation

enum APIRequest {

    case searchRepositoriesByStars(page:Int, fromDate:Date)
    
    private var scheme: String {
        return "https"
    }
    
    private var host: String {
        return "api.github.com"
    }
    
    private var path: String {
        switch self {
        case .searchRepositoriesByStars:
            return "/search/repositories"
        }
    }
    
    private var method: String {
        switch self {
        case .searchRepositoriesByStars:
            return "GET"
        }
    }
    
    private var queryItems: [String: String] {
        switch self {
        case .searchRepositoriesByStars(let page, let fromDate):
            return ["q": "created:>\(fromDate.asQueryString)",
                    "sort": "stars",
                    "order": "desc",
                    "page": "\(page)"]
        }
    }
    
    private var url: URL? {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = self.scheme
        urlComponents.host = self.host
        urlComponents.path = self.path
        urlComponents.queryItems = self.queryItems.map {
            URLQueryItem(name: $0.0, value: $0.1)
        }
        
        return urlComponents.url
    }
    
    var request: URLRequest? {
        if let url = self.url {
            var request: URLRequest = URLRequest(url: url)
            request.httpMethod = self.method
            return request
        }
        return nil
    }
}
