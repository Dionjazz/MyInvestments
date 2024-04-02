//
//  SearchResponse.swift
//  MyInvestments
//
//  Created by Igor Sapaev on 31.03.2024.
//

import Foundation

struct SearchResponse: Codable {
    let count: Int
    let result: [SearchResults]
}

struct SearchResults: Codable {
    let descriprion : String
    let displaySymbol : String
    let symbol : String
    let type : String
}
