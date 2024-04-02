//
//  DatabaseService.swift
//  PracticeUI
//
//  Created by Muktar Hussein on 02/04/2024.
//

import Foundation

struct DatabaseHelper {
    
    func getProducts() async throws -> [Product] {
        guard let url = URL(string: "https://dummyjson.com/products") else {
            throw URLError(.badServerResponse)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let productArray = try JSONDecoder().decode(ProductModel.self, from: data)
        return productArray.products
    }
    
    func getUsers() async throws -> [User] {
        guard let url = URL(string: "https://dummyjson.com/users") else {
            throw URLError(.badServerResponse)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let users = try JSONDecoder().decode(UserModel.self, from: data)
        return users.users
    }
    
    
    func getQuotes() async throws -> [Quote] {
        guard let url = URL(string: "https://dummyjson.com/users") else {
            throw URLError(.badServerResponse)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let quotes = try JSONDecoder().decode(QouteModel.self, from: data)
        return quotes.quotes
    }
    
}



class DatabaseService {
    
    
}
