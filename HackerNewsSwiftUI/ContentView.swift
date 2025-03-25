//
//  ContentView.swift
//  HackerNewsSwiftUI
//
//  Created by Rahul Padmakumar on 25/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        
        NavigationView{
            if #available(iOS 16.0, *) {
                List(networkManager.posts, rowContent: { id in
                    HStack{
                        Text(String(id.points ?? 0))
                        Text(id.title ?? "")
                    }
                }).scrollIndicators(.hidden, axes: .vertical)
                    .navigationTitle("Hacker News")
            } else {
                List(networkManager.posts, rowContent: { id in
                    HStack{
                        Text(String(id.points ?? 0))
                        Text(id.title ?? "")
                    }
                })
            }
        }
        .onAppear {
            networkManager.loadNews()
        }
    }
}

#Preview {
    ContentView()
}
