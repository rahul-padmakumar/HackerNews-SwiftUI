//
//  ContentView.swift
//  HackerNewsSwiftUI
//
//  Created by Rahul Padmakumar on 25/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path){
            List(networkManager.posts, rowContent: { id in
                NavigationLink(value: id) {
                    HStack{
                        Text(String(id.points ?? 0))
                        Text(id.title ?? "").onTapGesture {
                            path.append(id)
                        }
                    }
                }
            }).scrollIndicators(.hidden, axes: .vertical)
            .navigationTitle("Hacker News")
            .navigationDestination(for: Post.self, destination: { url in
                DetailView(url: url.url){
                    path.append(PathModel(path: .detail2))
                }
            })
            .navigationDestination(for: PathModel.self, destination:  {  model in
                Detail2()
            })
        }
    }
}

#Preview {
    ContentView()
}
