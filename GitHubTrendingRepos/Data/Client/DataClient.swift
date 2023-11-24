//
//  DataClient.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 22.11.2023.
//

import OSLog
import Foundation

protocol DataClient {
    var logger: Logger? { get }
    
    func getData(from: URL) async throws -> Data
}

extension DataClient {
    var logger: Logger? { AppLogger.data }

    func makeURL(endpoint: String, host: DataClientHost = .glitter, queryItems: [URLQueryItem] = []) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host.rawValue
        components.path = endpoint
        components.queryItems = queryItems
        
        guard let url = components.url else { fatalError("Invalid URL!") }
        
        return url
    }
    
    func makeDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
}

extension URLSession: DataClient {
    func getData(from url: URL) async throws -> Data {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return try await executeRequest(request)
    }
}

private extension URLSession {
    func executeRequest(_ request: URLRequest) async throws -> Data {
        let validStatus = 200...299
        guard let (data, response) = try await self.data(for: request) as? (Data, HTTPURLResponse),
              validStatus.contains(response.statusCode) else {
            throw DataError.network
        }

        return data
    }
}
