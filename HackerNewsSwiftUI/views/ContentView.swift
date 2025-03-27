//
//  ContentView.swift
//  HackerNewsSwiftUI
//
//  Created by Rahul Padmakumar on 25/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    @State var path: [Post] = []
    
    var body: some View {
        
        if #available(iOS 16.0, *) {
            NavigationStack(path: $path){
                List(networkManager.posts, rowContent: { id in
                    HStack{
                        Text(String(id.points ?? 0))
                        Text(id.title ?? "").onTapGesture {
                            path.append(id)
                        }
                    }.background()
                }).scrollIndicators(.hidden, axes: .vertical)
                .navigationTitle("Hacker News")
                .navigationDestination(for: Post.self, destination: { post in
                    DetailView(url: post.url)
                })
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

#Preview {
    ContentView()
}
