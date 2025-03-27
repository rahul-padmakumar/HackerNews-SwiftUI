//
//  DetailView.swift
//  HackerNewsSwiftUI
//
//  Created by Rahul Padmakumar on 26/03/25.
//

import SwiftUI

struct DetailView: View{
    
    let url: String?
    
    var onNavigateToNextScreen: (() -> Void)?
    
    var body: some View{
        Text(url ?? "").onTapGesture {
            onNavigateToNextScreen?()
        }
    }
}

#Preview{
    DetailView(url: "abc")
}
