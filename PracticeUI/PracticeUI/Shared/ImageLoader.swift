//
//  ImageLoader.swift
//  PracticeUI
//
//  Created by Muktar Hussein on 02/04/2024.
//

import SwiftUI
import SDWebImageSwiftUI


struct ImageLoader: View {
    var url = Constants.url
    var contentMode: ContentMode = .fill
    
    var body: some View {
        
        VStack {
            Rectangle()
                .opacity(0.001)
                .overlay {
                    WebImage(url: URL(string: url))
                        .resizable()
                        .indicator(.activity)
                        .aspectRatio(contentMode: contentMode)
                        .allowsHitTesting(false)
                }
                .clipped()

        }
    }
}

#Preview {
    ImageLoader()
        .cornerRadius(30)
        .padding(40)
        .padding(.vertical, 60)
}
