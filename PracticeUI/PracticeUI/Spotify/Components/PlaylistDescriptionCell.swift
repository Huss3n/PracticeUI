//
//  PlaylistDescriptionCell.swift
//  PracticeUI
//
//  Created by Muktar Hussein on 16/04/2024.
//

import SwiftUI

struct PlaylistDescriptionCell: View {
    var descriptionText: String = Product.mock.description
    var username: String = "Hussein"
    var subheadline: String = "this is a subheadline"
    var onAddToPlaylistPressed: (() -> Void)? = nil
    var onDownloadPressed: (() -> Void)? = nil
    var onSharePressed: (() -> Void)? = nil
    var onElipsisPressed: (() -> Void)? = nil
    var onShufflePressd: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(descriptionText)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            madeForYouSection
            
            Text(subheadline)
            
            
            HStack(spacing: 0) {
                
                HStack(spacing: 0) {
                    Image(systemName: "plus.circle")
                        .padding(8)
                        .background(.black.opacity(0.001))
                        .onTapGesture {
                            
                        }
                    Image(systemName: "arrow.down.circle")
                        .padding(8)
                        .background(.black.opacity(0.001))
                        .onTapGesture {
                            
                        }
                    
                    Image(systemName: "square.and.arrow.up")
                        .padding(8)
                        .background(.black.opacity(0.001))
                        .onTapGesture {
                            
                        }
                    
                    Image(systemName: "ellipsis")
                        .padding(8)
                        .background(.black.opacity(0.001))
                        .onTapGesture {
                            
                        }
                    
                }
                .offset(x: -8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: 8) {
                    Image(systemName: "shuffle.circle")
                        .font(.system(size: 24))
                        .background(.black.opacity(0.001))
                        .onTapGesture {
                            
                        }
                    
                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 46))
                        .foregroundStyle(.spotifyGreen)
                        .background(.black.opacity(0.001))
                        .onTapGesture {
                            
                        }
                }
           
            }
            
        }
        .foregroundStyle(.spotifyLightGray)
//        .font(.title2)
        .fontWeight(.medium)
        .padding(8)
    }
    
    private var madeForYouSection: some View {
        HStack(spacing: 8) {
            Image(systemName: "applelogo")
                .foregroundStyle(.spotifyGreen)
            
            Text("Made for ")
            +
            Text(username)
                .font(.headline)
                .fontWeight(.bold)
                
        }
    }
    
}

#Preview {
    ZStack {
        Color.spotifyBlack
            .ignoresSafeArea()
        
        PlaylistDescriptionCell()
    }
}
