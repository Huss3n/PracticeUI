//
//  SpotifyPlaylistView.swift
//  PracticeUI
//
//  Created by Muktar Hussein on 16/04/2024.
//

import SwiftUI

struct SpotifyPlaylistView: View {
    var product: Product = .mock
    var user: User = .mock
    @State private var products: [Product] = []
    
    @State private var showHeader: Bool = true
    
    
    var body: some View {
        
        ZStack {
            Color.spotifyBlack
                .ignoresSafeArea()
            ScrollView(.vertical) {
                LazyVStack {
                    PlaylistHeaderCell(
                        startingHeight: 350,
                        title: product.title,
                        subtitle: product.brand,
                        imageName: product.thumbnail
                    )
                    .readingFrame { frame in
                        showHeader = frame.maxY < 150
                    }
                    
                    PlaylistDescriptionCell(
                        descriptionText: product.description,
                        username: user.firstName,
                        subheadline: product.category,
                        onAddToPlaylistPressed: nil,
                        onDownloadPressed: nil,
                        onSharePressed: nil,
                        onElipsisPressed: nil,
                        onShufflePressd: nil,
                        onPlayPressed: nil
                    )
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    
                    ForEach(products) { product in
                        SongRowCell(
                            imageName: product.firstImage,
                            imageSize: 60,
                            title: product.title,
                            subtitle: product.brand) {
                                
                            } onCellPressed: {
                                
                            }
                            .padding(.horizontal, 16)
                    }
                }
            }
            .scrollIndicators(.hidden)
            
            ZStack {
                Text(product.title)
                    .font(.headline)
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
                    .background(.spotifyBlack)
                    .offset(y: showHeader ? 0 : -40)
                    .opacity(showHeader ? 1 : 0)
                
                
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .padding(10)
                    .background(showHeader ? Color.black.opacity(0.001) : .spotifyGray.opacity(0.7))
                    .clipShape(Circle())
                    .onTapGesture {
                        
                    }
                    .padding(.leading, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
            }
            .foregroundStyle(.spotifyWhite)
            .frame(maxHeight: .infinity, alignment: .top)
            .animation(.smooth(duration: 0.2), value: showHeader)
            
        }
        .task {
            await getProducts()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getProducts() async {
        do {
            products = try await DatabaseHelper().getProducts()
            
        } catch  {
            print("Error getting products \(error.localizedDescription)")
        }
    }
}

#Preview {
    SpotifyPlaylistView()
}
