//
//  APIRoute.swift
//  iOS-Demo
//
//  Created by Enrique Bermúdez on 2/1/19.
//  Copyright © 2019 Enrique Bermudez. All rights reserved.
//

import Foundation

enum APIRequest {

    case repository(page:Int)
    
    private func httpProtocol() -> String {
        return "https"
    }
    
    private func basePath() -> String {
        return "api.github.com"
    }
    
    private func path() -> String {
        switch self {
        case .repository:
            return "/search/repositories"
        }
    }
    
    private func method() -> String {
        switch self {
        case .repository:
            return "GET"
        }
    }
    
    private func parameters() -> [String:String] {
        switch self {
        case .repository:
            return [:]
        }
    }
    
    private func url() -> URL? {
        return URL(string: "\(self.httpProtocol())://\(self.basePath())\(self.path())")
    }
    
    func request() -> URLRequest? {
        if let url = self.url() {
            
            var request: URLRequest = URLRequest(url: url)
            request.httpMethod = self.method()
            return request
        }
        return nil
    }
}
