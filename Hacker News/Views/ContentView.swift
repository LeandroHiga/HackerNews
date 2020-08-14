//
//  ContentView.swift
//  Hacker News
//
//  Created by Lean Caro on 04/08/2020.
//  Copyright © 2020 Leandro Higa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager() //ObservedObjecto to set the property networkManager as a "listener"
    
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in //Loop through each post in posts array
                
                NavigationLink(destination: DetalView(url: post.url)) {
                    
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
            }
            .navigationBarTitle("Hacker News")
        }
            .onAppear {  //As soon as the View appears, fetchData method is triggered. Similar to ViewDidLoad() in UIKit
                self.networkManager.fetchData()
        }
    }
}
