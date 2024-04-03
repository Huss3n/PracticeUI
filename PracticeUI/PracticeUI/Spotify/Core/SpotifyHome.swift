//
//  SpotifyHome.swift
//  PracticeUI
//
//  Created by Muktar Hussein on 03/04/2024.
//

import SwiftUI

struct SpotifyHome: View {
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = nil
    
    var body: some View {
        ZStack {
            Color.spotifyBlack
                .ignoresSafeArea()
            
            HStack {
                ZStack {
                    if let currentUser {
                        ImageLoader(url: currentUser.image)
                            .background(.spotifyWhite)
                            .clipShape(Circle())
                            .onTapGesture {
                                
                            }
                    }
                }
                .frame(width: 30, height: 30)
                
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
                }
                .scrollIndicators(.hidden)
            }
        }
        .task {
            await getUsers()
        }
        
    }
    
    private func getUsers() async {
        do {
            currentUser = try await DatabaseHelper().getUsers().first
        } catch  {
            print("Error getting users \(error.localizedDescription)")
        }
    }
}

#Preview {
    SpotifyHome()
}
