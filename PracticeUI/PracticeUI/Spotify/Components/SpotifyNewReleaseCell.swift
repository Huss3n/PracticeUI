//
//  SpotifyNewReleaseCell.swift
//  PracticeUI
//
//  Created by Muktar Hussein on 06/04/2024.
//

import SwiftUI

struct SpotifyNewReleaseCell: View {
    var imageName: String = Constants.url
    var headline: String? = "New release"
    var subheadline: String? = "From the"
    var title: String? = "New title"
    var subtitle: String? = "This is a subtitle"
    var onAddToPlaylistPressed: (() -> Void)? = nil
    
    var body: some View {
        
        VStack(spacing: 16) {
            HStack(spacing: 8) {
                ImageLoader(url: imageName)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 2) {
                    if let headline {
                        Text(headline)
                            .foregroundStyle(.spotifyLightGray)
                            .font(.callout)
                    }
                    
                    if let subheadline {
                        Text(subheadline)
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundStyle(.spotifyWhite)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            } // end of hstack
            
            HStack {
                ImageLoader(url: imageName)
                    .frame(width: 140, height: 140)
                
                VStack(alignment: .leading, spacing: 32) {
                    VStack(alignment: .leading, spacing: 2) {
                        if let title {
                            Text(title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.spotifyWhite)
                        }
                        
                        if let subtitle {
                            Text(subtitle)
                                .foregroundStyle(.spotifyWhite)
                        }
                    }
                    .font(.callout)
                    
                    HStack(spacing: 0) {
                        Image(systemName: "plus.circle")
                            .background(.black.opacity(0.001))
                            .padding(4)
                            .offset(x: -4)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .onTapGesture {
                                onAddToPlaylistPressed?()
                            }
                        
                        Image(systemName: "play.circle.fill")
                            .foregroundStyle(.spotifyWhite)
                            .font(.title)
                    }
                    .foregroundStyle(.spotifyLightGray)
                    .font(.title2)
                    .onTapGesture {
                        //
                    }
                }
                
            }
            .padding(.trailing, 16)
            .cornerRadius(16)
            .themeColors(isSelected: false)
        } // end of vstack
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack
            .ignoresSafeArea()
        
        SpotifyNewReleaseCell()
            .padding()
    }
}
