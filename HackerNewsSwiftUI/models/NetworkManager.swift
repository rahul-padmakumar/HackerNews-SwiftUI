//
//  NetworkManager.swift
//  HackerNewsSwiftUI
//
//  Created by Rahul Padmakumar on 25/03/25.
//

import Foundation

class NetworkManager: ObservableObject{

    @Published var posts = [Post]()
    
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
