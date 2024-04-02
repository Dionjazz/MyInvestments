//
//  APIManager.swift
//  MyInvestments
//
//  Created by Igor Sapaev on 29.03.2024.
//

import Foundation

final class APIManager {
    
    static let shared = APIManager()
    
    //MARK: - Public
    
    public func search(
        query: String,
        completion: @escaping (Result<SearchResponse, Error>) -> Void
    ) {

        request(url: url(for: .search, queryParam: ["q" : query]), expecting: SearchResponse.self, completion: completion)
    }
    
    // MARK: - Private
    private init() {
        
    }
    
    private struct Constants {
        static let apiKey = "co4q8f1r01qnik2utnvgco4q8f1r01qnik2uto00"
        static let sandBoxApiKey = ""
        static let baseUrl = "https://finnhub.io/api/v1"
    }
    
    private enum Endpoint: String {
        case search
    }
    
    private enum APIError: Error {
        case invalidUrl
        case noDataReturn
    }
    
    private func url(for endpoint: Endpoint,
                     queryParam: [String: String] = [:]
    ) -> URL? {
        var urlString = Constants.baseUrl + endpoint.rawValue
        
        var queryItems = [URLQueryItem]()
        
        for(name, value) in queryParam {
            queryItems.append(.init(name: name, value: value))
        }
        
        queryItems.append(.init(name: "token", value: Constants.apiKey))
        
        let queryString = queryItems.map { "\($0.name)=\($0.value ?? "")" }.joined(separator: "&")
        
        urlString += "?" + queryString
        
        print("\n\(urlString)\n")
        
        return URL(string: urlString)
    }
    
    private func request<T: Codable>(url: URL?, expecting: T.Type, completion: @escaping(Result<T, Error>) -> Void) {
        guard let url = url else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(APIError.noDataReturn))
                }
                return
            }
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
        
        

    
}
