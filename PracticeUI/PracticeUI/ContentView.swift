//
//  ContentView.swift
//  PracticeUI
//
//  Created by Muktar Hussein on 02/04/2024.
//

import SwiftUI
import SwiftfulRouting

struct ContentView: View {
    @Environment(\.router) var router
    
    var body: some View {
        RouterView(content: { _ in
            List {
                Button("Open Spotify") {
                    router.showScreen(.fullScreenCover) { _ in
                        SpotifyHome()
                    }
                }
            }
        })
        .padding()
    }
}

#Preview {
    RouterView { _ in
        ContentView()
    }
}

//
//struct MainView: View {
//    var body: some View {
//        TabView {
//            ProductView()
//                .tabItem {
//                    Image(systemName: "bag")
//                }
//            
//            UserView()
//                .tabItem {
//                    Image(systemName: "person.fill")
//                }
//        }
//    }
//}


//
//struct ProductView: View {
//    @State private var products: [Product] = []
//    
//    var body: some View {
//        ScrollView {
//            VStack {
//                ForEach(products){ product in
//                    Text(product.title)
//                }
//            }
//            .task {
//                await getProducts()
//            }
//        }
//    }
//    
//    private func getProducts() async {
//        do {
//            products = try await DatabaseHelper().getProducts()
//        } catch  {
//            print("Error getting products \(error.localizedDescription)")
//        }
//    }
//}


//struct UserView: View {
//    @State private var users: [User] = []
//    
//    var body: some View {
//        ScrollView {
//            VStack {
//                ForEach(users){ user in
//                    Text(user.firstName)
//                }
//            }
//            .task {
//                await getUsers()
//            }
//        }
//    }
    
//    private func getUsers() async {
//        do {
//            users = try await DatabaseHelper().getUsers()
//        } catch  {
//            print("Error getting users \(error.localizedDescription)")
//        }
//    }
//}


//struct QouteView: View {
//    @State private var qoutes: [Quote] = []
//    
//    var body: some View {
//        ScrollView {
//            VStack {
////                ForEach(qoutes){ quote in
////                    Text(quote.description)
////                }
//            }
//            .task {
//                await getQoutes()
//            }
//        }
//    }
//    
//    private func getQoutes() async {
//        do {
//            qoutes = try await DatabaseHelper().getQuotes()
//        } catch  {
//            print("Error getting quotes \(error.localizedDescription)")
//        }
//    }
//}
