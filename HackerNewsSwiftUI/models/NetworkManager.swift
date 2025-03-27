//
//  NetworkManager.swift
//  HackerNewsSwiftUI
//
//  Created by Rahul Padmakumar on 25/03/25.
//

import Foundation

class NetworkManager: ObservableObject{

    @Published var posts = [
        Post(title: "Hello1", url: "1", points: 100, objectID: "1"),
        Post(title: "Hello2", url: "2", points: 20, objectID: "2"),
        Post(title: "Hello3", url: "3", points: 150, objectID: "3"),
        Post(title: "Hello4", url: "4", points: 180, objectID: "4")
    ]
        
    func loadNews(){
        if let safeUrl = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: safeUrl) { data, response, error in
                if error != nil {
                    print(error!)
                } else {
                    let jsonDecoder = JSONDecoder()
                    if let safeData = data{
                        do{
                            let safePostModel = try jsonDecoder.decode(PostModel.self, from: safeData)
                            if let hits = safePostModel.hits{
                                DispatchQueue.main.async {
                                    self.posts = hits
                                }
                            }
                        } catch let error{
                            print(error)
                        }
                        
                    }
                }
            }
            task.resume()
        }
    }
}
