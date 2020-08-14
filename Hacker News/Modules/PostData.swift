//
//  PostData.swift
//  Hacker News
//
//  Created by Lean Caro on 04/08/2020.
//  Copyright © 2020 Leandro Higa. All rights reserved.
//

import Foundation

class Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    
    var id: String { //Computed propery to return the objectID that is the identifier. It is needed the identifier so that the List know how to order the each item
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
    
}
