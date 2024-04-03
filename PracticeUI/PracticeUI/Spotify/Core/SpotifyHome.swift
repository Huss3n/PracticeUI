//
//  SpotifyHome.swift
//  PracticeUI
//
//  Created by Muktar Hussein on 03/04/2024.
//

import SwiftUI

struct SpotifyHome: View {
    @State private var currentUser: User? = nil
    
    var body: some View {
        ZStack {
            Color.spotifyBlack
                .ignoresSafeArea()
            
            HStack {
                ScrollView(.horizontal) {
                    HStack {
                        if let currentUser {
                            ImageLoader(url: currentUser.image)
                                .frame(width: 30, height: 30)
                                .background(.spotifyWhite)
                                .clipShape(Circle())
                                .onTapGesture {
                                    
                                }
                        }
                        
                        Group {
                            Button(action: {}, label: {
                                Text("All")
                                    
                            })
                            
                            Button(action: {}, label: {
                                Text("Music")
                            })
                            
                            Button(action: {}, label: {
                                Text("Podcasts")
                            })
                            
                            Button(action: {}, label: {
                                Text("Audiobooks")
                            })
                        }
                        .foregroundStyle(.spotifyWhite)
                        .padding()
                        .background(.spotifyGreen)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                }
                .scrollIndicators(.hidden)
            }
        }
        .task {
            await getUsers()
        }
        
    }
    
    private func getUsers() async {
        do {
            currentUser = try await DatabaseHelper().getUsers().first
        } catch  {
            print("Error getting users \(error.localizedDescription)")
        }
    }
}

#Preview {
    SpotifyHome()
}
