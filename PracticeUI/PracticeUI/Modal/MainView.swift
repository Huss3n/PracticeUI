//
//  MainView.swift
//  PracticeUI
//
//  Created by Muktar Hussein on 06/04/2024.
//

import SwiftUI

struct MainView2: View {
    @State private var showSheet = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
            }
            .sheet(isPresented: $showSheet) {
                GoToSettings(isPresented: $showSheet)
                    .presentationDetents([.fraction(0.7)])
            }
            
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    showSheet = true
                }
            }
        }
        
    }
}

#Preview {
   MainView2()
}

struct GoToSettings: View {
    @Binding var isPresented: Bool
    var body: some View {
        NavigationStack {
            ZStack {
                Color.spotifyBlack.opacity(0.9)
                    .ignoresSafeArea()
                
                
                VStack(spacing: 12) {
                    // Bell icon
                    Group {
                        Image(systemName: "bell.fill")
                            .font(.title)
                            .padding()
                            .foregroundStyle(.green)
                            .background(Color.spotifyBlack)
                            .clipShape(Circle())
                    }
                    .padding(.top, 16)
                        
                    
                    Group {
                        Text("Turn on Notifications")
                        Text("For WhatsApp")
                    }
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.semibold)
                    
                    Text("Allow WhatsApp to send you notifications to stay connected with friends and family")
                        .multilineTextAlignment(.center)
//                        .lineLimit(4)
                        .foregroundStyle(.white)
                        .font(.headline)
//                        .padding(.top, 12)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        HStack(spacing: 26) {
                            Image(systemName: "message.fill")
                                .foregroundStyle(.green)
                            Text("Find out when you receive messages")
                        }
                        .foregroundStyle(.white)
                        .font(.headline)
                        
                        HStack(spacing: 26) {
                            Image(systemName: "person.2.fill")
                                .foregroundStyle(.green)
                            Text("Learn when you are added to groups")
                        }
                        .foregroundStyle(.white)
                        .font(.headline)
                        
                        HStack(spacing: 26) {
                            Image(systemName: "gear")
                                .foregroundStyle(.green)
                            Text("Change this setting at any time")
                        }
                        .foregroundStyle(.white)
                        .font(.headline)
                    }
                    .padding(.top, 32)
                    
                    
                    Text("Go To Settings")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.green)
                        .cornerRadius(20)
                        .padding(6)
                        .padding(.top, 40)
                    
                    Spacer()
                    
                }
                .padding(.leading, 10)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Image(systemName: "xmark")
                            .font(.subheadline)
                            .foregroundStyle(.white)
                            .padding(8)
                            .background(.spotifyGray.opacity(0.8))
                            .clipShape(Circle())
                            .onTapGesture {
                                withAnimation(.spring) {
                                    isPresented.toggle()
                                }
                            }
                    }
                }
            }
        }
    }
}
