//
//  URLSession+Retrieval.swift
//  SimpleAnalyticsClient
//
//  Created by Joseph Wardell on 3/18/23.
//

import Foundation

extension URLSession {
    
    enum RetrievalError: Error {
        case notHTTPResponse
        case badStatusCode(Int, String)
    }
    
    func retrieve<T: Decodable>(_ request: URLRequest) async throws -> T {
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = (response as? HTTPURLResponse) else { throw RetrievalError.notHTTPResponse }
        guard httpResponse.statusCode == 200 else {
            let payload = String(data: data, encoding: .utf8) ?? "no data"
            throw RetrievalError.badStatusCode(httpResponse.statusCode, payload)
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
    
}

extension URLSession.RetrievalError: LocalizedError {
    
    var failureReason: String? {
        switch self {
        case .notHTTPResponse: return "The response was not an HTTP Response"
        case .badStatusCode(let statuscode, let data): return "HTTP Response status code: \(statuscode) \(data)"
        }
    }

}
