//
//  SpotifyHome.swift
//  PracticeUI
//
//  Created by Muktar Hussein on 03/04/2024.
//

import SwiftUI
import SwiftfulUI


struct SpotifyHome: View {
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = nil
    
    @State private var products: [Product] = []
    @State private var productRow: [ProductRow] = []
    
    var body: some View {
        ZStack {
            Color.spotifyBlack
                .ignoresSafeArea()
            
            ScrollView(.vertical) {
                
                LazyVStack(spacing: 2, pinnedViews: [.sectionHeaders], content: {
                    Section {
                        
                        VStack {
                            recentSection
                                .padding(.horizontal, 16)
                            
                            if let product = products.first {
                                newReleaseSection(product: product)
                                    .padding(.horizontal, 16)
                            }
                            
                            listRows
                        }
                        
                    } header: {
                        header
                    }
                })
                .padding(.top, 8)
                
            }
            .scrollIndicators(.hidden)
            .clipped()
            
        }
        .task {
            await getUsers()
            await getProducts()
        }
        .toolbar(.hidden, for: .navigationBar)
        
    }
    
    private func getUsers() async {
        do {
            currentUser = try await DatabaseHelper().getUsers().first
        } catch  {
            print("Error getting users \(error.localizedDescription)")
        }
    }
    
    private func getProducts() async {
        do {
            products = try await Array(DatabaseHelper().getProducts().prefix(8))
            
            var rows: [ProductRow] = []
            
            let allbrands = Set(products.map({ $0.brand })) // <- removes duplicates
            
            for brand in allbrands {
                //                let brandProducts = products.filter({ $0.brand == brand })
                rows.append(ProductRow(title: brand.capitalized, product: products))
            }
            productRow = rows
            
            
        } catch  {
            print("Error getting products \(error.localizedDescription)")
        }
    }
    
    
    private var header: some View {
        HStack(spacing: 16) {
            ZStack {
                if let currentUser {
                    ImageLoader(url: currentUser.image)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            
                        }
                }
            }
            .frame(width: 35, height: 35)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCategoryCell(
                            title: category.rawValue.capitalized,
                            isSelected: category == selectedCategory
                        )
                        .onTapGesture {
                            selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
            
        }
        .padding(.vertical, 24)
        .background(.spotifyBlack)
        //        .padding(.leading, 8)
    }
    
    private var recentSection: some View {
        NonLazyVGrid(
            columns: 2,
            alignment: .center,
            spacing: 10,
            items: products) { product in
                if let product {
                    SpotifyRecentCell(
                        imageName: product.firstImage,
                        title: product.title
                    )
                    .asButton(.press) {
                        //
                    }
                }
            }
    }
    
    private func newReleaseSection(product: Product) -> some View {
        SpotifyNewReleaseCell(
            imageName: product.firstImage,
            headline: product.brand,
            subheadline: product.category,
            title: product.title,
            subtitle: product.description) {
                //
            }
    }
    
    private var listRows: some View {
        ForEach(productRow) { row in
            VStack(spacing: 8) {
                Text(row.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.spotifyWhite)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.horizontal) {
                    HStack(alignment: .top, spacing: 16) {
                        ForEach(row.product) { product in
                            ImageTitleRowCell(
                                imageName: product.firstImage,
                                imageSize: 120,
                                title: row.title
                            )
                            .asButton(.press) {
                                //
                            }
                        }
                        
                    }
                    .padding(.horizontal, 16)
                    
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    SpotifyHome()
}
