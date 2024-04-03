//
//  SpotifyRecentCell.swift
//  PracticeUI
//
//  Created by Muktar Hussein on 03/04/2024.
//

import SwiftUI

struct SpotifyRecentCell: View {
    var imageName: String = Constants.url
    var title: String = "Some random title"
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            ImageLoader(url: imageName)
                .frame(width: 55, height: 55)
            
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2)
            
        }
        .foregroundStyle(.red)
        .padding(.trailing, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.blue)
        .cornerRadius(6)
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack
            .ignoresSafeArea()
        
        VStack {
            HStack {
                SpotifyRecentCell()
                SpotifyRecentCell()
            }
            
            HStack {
                SpotifyRecentCell()
                SpotifyRecentCell()
            }
            
            HStack {
                SpotifyRecentCell()
                SpotifyRecentCell()
            }
            
            HStack {
                SpotifyRecentCell()
                SpotifyRecentCell()
            }
        }
    }
}
