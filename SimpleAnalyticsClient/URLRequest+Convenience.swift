//
//  URLRequest+Convenience.swift
//  DailyWeatherModel
//
//  Created by Joseph Wardell on 2/27/23.
//

import Foundation

extension URLRequest {
    
    enum Method: String {
        case get
        case post
        case put
        case delete
        
        var asString: String { rawValue.uppercased() }
    }
        
    init?(_ components: URLComponents, method: Method = .get, body: Data? = nil, headers: [(String, String)] = []) {
        guard let url = components.url else { return nil }
        self.init(url: url)
        self.httpMethod = method.asString
        self.httpBody = body
        
        for header in headers {
            self.setValue(header.1, forHTTPHeaderField: header.0)
        }
    }
}
