//
//  SpotifyPlaylistView.swift
//  PracticeUI
//
//  Created by Muktar Hussein on 16/04/2024.
//

import SwiftUI

struct SpotifyPlaylistView: View {
    var product: Product = .mock
    
    
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
                }
            }
            .scrollIndicators(.hidden)
            
        }
    }
}

#Preview {
    SpotifyPlaylistView()
}
