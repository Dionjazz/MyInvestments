//
//  APIManager.swift
//  MyInvestments
//
//  Created by Igor Sapaev on 29.03.2024.
//

import Foundation

final class APIManager {
    
    static let shared = APIManager()
    
    private init() {
        
    }
    
    private struct Constants {
        static let apiKey = ""
        static let sandBoxApiKey = ""
        static let baseUrl = ""
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
        
        return nil
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
