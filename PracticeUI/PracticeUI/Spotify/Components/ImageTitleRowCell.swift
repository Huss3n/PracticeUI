//
//  ImageTitleRowCell.swift
//  PracticeUI
//
//  Created by Muktar Hussein on 16/04/2024.
//

import SwiftUI

struct ImageTitleRowCell: View {
    let url = Constants.url
    var body: some View {
        VStack(alignment: .center) {
            ImageLoader(url: url)
                .frame(width: 140, height: 140)
            
            Text("iPhone x")
                .foregroundStyle(.spotifyLightGray)
        }
    }
}

#Preview {
    ImageTitleRowCell()
}
