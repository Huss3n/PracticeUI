//
//  ImageTitleRowCell.swift
//  PracticeUI
//
//  Created by Muktar Hussein on 16/04/2024.
//

import SwiftUI

struct ImageTitleRowCell: View {
    var imageName: String = Constants.url
    var imageSize: CGFloat = 100
    var title: String? = "iPhone X"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ImageLoader(url: imageName)
                .frame(width: imageSize, height: imageSize)
            
            if let title {
                Text(title)
                    .font(.callout)
                    .lineLimit(2)
                    .foregroundStyle(.spotifyLightGray)
            }
        }
        .frame(width: imageSize)
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack
            .ignoresSafeArea()
        
        ImageTitleRowCell()
        
    }
}
