//
//  Product.swift
//  PracticeUI
//
//  Created by Muktar Hussein on 02/04/2024.
//

import Foundation

/*
 "id": 1,
 "title": "iPhone 9",
 "description": "An apple mobile which is nothing like apple",
 "price": 549,
 "discountPercentage": 12.96,
 "rating": 4.69,
 "stock": 94,
 "brand": "Apple",
 "category": "smartphones",
 "thumbnail": "https://cdn.dummyjson.com/product-images/1/thumbnail.jpg",
 "images": [
 "https://cdn.dummyjson.com/product-images/1/1.jpg",
 "https://cdn.dummyjson.com/product-images/1/2.jpg",
 "https://cdn.dummyjson.com/product-images/1/3.jpg",
 "https://cdn.dummyjson.com/product-images/1/4.jpg",
 "https://cdn.dummyjson.com/product-images/1/thumbnail.jpg"
 ]
 */

// MARK: - ProductModel
struct ProductModel: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}
