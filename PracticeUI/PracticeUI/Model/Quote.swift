//
//  Quote.swift
//  PracticeUI
//
//  Created by Muktar Hussein on 02/04/2024.
//

import Foundation

// MARK: - QouteModel
struct QouteModel: Codable {
    let quotes: [Quote]
    let total, skip, limit: Int
}

// MARK: - Quote
struct Quote: Codable, Identifiable {
    let id: Int
    let quote, author: String
}
