//
//  URLSession+Retrieval.swift
//  SimpleAnalyticsClient
//
//  Created by Joseph Wardell on 3/18/23.
//

import Foundation

extension URLSession {
    
    func retrieve<T: Decodable>(_ request: URLRequest) async throws -> T {
        
        let (data, response) = try await URLSession.shared.data(for: request)
        let statusCode = (response as? HTTPURLResponse)?.statusCode
        print("status code: \(String(describing: statusCode))")
        print("response: \"\(String(data: data, encoding: .utf8) ?? "no data")\"")

        return try JSONDecoder().decode(T.self, from: data)
    }
    
}
