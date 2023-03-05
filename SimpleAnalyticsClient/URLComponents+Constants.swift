//
//  URLComponents+Constants.swift
//  SimpleAnalyticsClient
//
//  Created by Joseph Wardell on 3/5/23.
//

import Foundation

extension URLComponents {
    
    static func testServer() -> URLComponents {
        var out = URLComponents()
        out.scheme = "http"
        out.host = "localhost"
        out.port = 8080
        
        return out
    }
}
