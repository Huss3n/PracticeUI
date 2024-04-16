//
//  PlaylistHeaderCell.swift
//  PracticeUI
//
//  Created by Muktar Hussein on 16/04/2024.
//

import SwiftUI
import SwiftfulUI

struct PlaylistHeaderCell: View {
    var startingHeight: CGFloat = 300
    var title: String = "Title goes here"
    var subtitle: String = "Subtitle goes here"
    var imageName: String = Constants.url
    let shadowColor: Color = Color.spotifyBlack.opacity(0.8)
    
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay (
                ImageLoader(url: imageName)
            )
            .overlay (
                VStack(alignment: .leading, spacing: 8) {
                    Text(title)
                        .font(.headline)
                    Text(subtitle)
                        .font(.largeTitle)
                }
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .bottomLeading)
                .background(
                    LinearGradient(
                        colors: [shadowColor.opacity(0), shadowColor],
                        startPoint: .top,
                        endPoint: .bottom)
                    , alignment: .bottomLeading
                )
                , alignment: .bottomLeading
            )
            .asStretchyHeader(startingHeight: startingHeight)
            .frame(height: 300)
            
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack
            .ignoresSafeArea()
        
        ScrollView {
            PlaylistHeaderCell()
        }
        .ignoresSafeArea()
    }
    
   
}
