//
//  PostModel.swift
//  HackerNewsSwiftUI
//
//  Created by Rahul Padmakumar on 25/03/25.
//

import Foundation

struct PostModel: Decodable{
    let hits: [Post]?
}

struct Post: Decodable, Identifiable{
    let title: String?
    let url: String?
    let points: Int?
    let objectID: String?
    var id: String? {
        return objectID
    }
}
