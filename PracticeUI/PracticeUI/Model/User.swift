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
    
    static var mock: User {
        User (
            id: 123,
            firstName: "Hussein",
            lastName: "Aisak",
            age: 23,
            email: "abc@test.com",
            phone: "12345678",
            username: "@hussein",
            password: "abcde123",
            birthDate: "2000",
            image: Constants.url,
            bloodGroup: "AB",
            height: 140,
            weight: 64
            )
    }
}
