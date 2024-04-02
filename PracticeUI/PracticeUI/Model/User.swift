//
//  User.swift
//  PracticeUI
//
//  Created by Muktar Hussein on 02/04/2024.
//

import Foundation

// MARK: - UserModel
struct UserModel: Codable {
    let users: [User]
    let total, skip, limit: Int
}

// MARK: - User
struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName: String
    let age: Int
    let email, phone, username, password: String
    let birthDate: String
    let image: String
    let bloodGroup: String
    let height: Int
    let weight: Double
}
