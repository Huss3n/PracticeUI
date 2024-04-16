//
//  SongRowCell.swift
//  PracticeUI
//
//  Created by Muktar Hussein on 16/04/2024.
//

import SwiftUI
import SwiftfulUI

struct SongRowCell: View {
    var imageName: String = Constants.url
    var imageSize: CGFloat = 60
    var title: String = "iPhone"
    var subtitle: String = "Apple"
    var onEllipsisPressed: (() -> Void)? = nil
    var onCellPressed: (() -> Void)? = nil
    
    var body: some View {
        HStack(alignment: .top ,spacing: 8) {
        ImageLoader(url: imageName)
                .frame(width: imageSize, height: imageSize)
                .clipped()
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundStyle(.spotifyWhite)
                Text(subtitle)
                    .font(.callout)
                    .foregroundStyle(.spotifyLightGray)
            }
            .lineLimit(2)
            
            Image(systemName: "ellipsis")
                .font(.subheadline)
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .background(.black.opacity(0.001))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .onTapGesture {
                    onEllipsisPressed?()
                }
            
        }
//        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.black.opacity(0.001))
        .onTapGesture {
            onCellPressed?()
        }

    }
}

#Preview {
    ZStack {
        Color.spotifyBlack
            .ignoresSafeArea()
        
        VStack {
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
        }
        .padding(.horizontal, 8)
    }
    
   
}
