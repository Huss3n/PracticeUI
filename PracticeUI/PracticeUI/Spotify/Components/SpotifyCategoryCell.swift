//
//  SpotifyCategoryCell.swift
//  PracticeUI
//
//  Created by Muktar Hussein on 03/04/2024.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    var title: String = "All"
    var isSelected: Bool = false
    
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 35)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .themeColors(isSelected: isSelected)
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        
        VStack {
            SpotifyCategoryCell(title: "Music", isSelected: false)
            SpotifyCategoryCell(title: "All", isSelected: true)
            SpotifyCategoryCell(title: "Audiobooks", isSelected: true)
        }
        
        
    }
}
