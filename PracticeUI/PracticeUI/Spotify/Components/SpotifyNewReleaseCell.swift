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
    var title: String? = ""
    var subtitle: String? = ""
    
    
    var body: some View {
        
        VStack(spacing: 16) {
            HStack(spacing: 8) {
                ImageLoader(url: imageName)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                HStack {
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
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            
        }
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack
            .ignoresSafeArea()
        
        SpotifyNewReleaseCell()
    }
}
