//
//  BumbleHomeView.swift
//  PracticeUI
//
//  Created by Muktar Hussein on 17/04/2024.
//

import SwiftUI

struct BumbleHomeView: View {
    var body: some View {
        VStack(spacing: 8) {
            bumbleHeader
            Spacer()
            
            
        }
        .padding(8)
    }
    
    private var bumbleHeader: some View {
        HStack (spacing: 0) {
            HStack(spacing: 0) {
                Image(systemName: "line.horizontal.3")
                    .padding(8)
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "arrow.uturn.left")
                    .padding(8)
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
            }
            .font(.title2)
            .fontWeight(.medium)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("bumble")
                .font(.title)
                .foregroundStyle(.bumbleYellow)
                .frame(maxWidth: .infinity, alignment: .center)
            
            HStack(spacing: 0) {
                Image(systemName: "slider.horizontal.3")
                    .padding(8)
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
            }
            .font(.title2)
            .fontWeight(.medium)
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .foregroundStyle(.bumbleBlack)
    }
    
}

#Preview {
    ZStack {
        Color.bumbleWhite
            .ignoresSafeArea()
        
        BumbleHomeView()
    }
    
}
