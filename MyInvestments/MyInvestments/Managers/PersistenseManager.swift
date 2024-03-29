//
//  PersistenseManager.swift
//  MyInvestments
//
//  Created by Igor Sapaev on 29.03.2024.
//

import Foundation

final class PersistenseManager {
    static let shared = PersistenseManager()
    
    private let userDefualts: UserDefaults = .standard
    
    private struct Constants {
        
    }
    
    private init () {
        
    }
    
    // MARK: - Public
    
    public var watchList: [String] {
        return []
    }
    
    public func addToWatchList() {
        
    }
    
    public func removeFromWatchList() {
        
    }
    
    // MARK: - Private
    
    private var hasOnboarded: Bool {
        return false
    }
    
}
