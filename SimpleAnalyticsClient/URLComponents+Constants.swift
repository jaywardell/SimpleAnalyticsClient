//
//  URLComponents+Constants.swift
//  SimpleAnalyticsClient
//
//  Created by Joseph Wardell on 3/5/23.
//

import Foundation

extension URLComponents {
    
    static func testServer() -> URLComponents {
        URLComponents(scheme: .http, host: "localhost", port: 8080)
    }
}
