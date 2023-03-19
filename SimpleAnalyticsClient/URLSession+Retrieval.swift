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
    
    private func retrieveData(from request: URLRequest) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = (response as? HTTPURLResponse) else { throw RetrievalError.notHTTPResponse }
        guard httpResponse.statusCode == 200 else {
            let payload = String(data: data, encoding: .utf8) ?? "no data"
            throw RetrievalError.badStatusCode(httpResponse.statusCode, payload)
        }
        
        return data
    }
    
    func retrieve<T: Decodable>(_ request: URLRequest) async throws -> T {
        let data = try await retrieveData(from: request)
        
        return try JSONDecoder().decode(T.self, from: data)
    }

    func send(_ request: URLRequest) async throws {
        
        _ = try await retrieveData(from: request)
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
