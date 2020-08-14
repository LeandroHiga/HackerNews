//
//  NetworkManager.swift
//  Hacker News
//
//  Created by Lean Caro on 04/08/2020.
//  Copyright © 2020 Leandro Higa. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject { //Make the NetworkManager Observable
    
    @Published var posts = [Post]() //Publish the posts to any interested parties and notify the "listeners"
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil { //Check if theres is not error
                    let decoder = JSONDecoder()
                    
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async { //Fetch the main thread
                                self.posts = results.hits //posts will cotain all the hits from the results
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume() //Start networking task
        }
    }
}
