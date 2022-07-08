//
//  Results.swift
//  Hacker News
//
//  Created by Sai Abhilash Gudavalli on 03/07/22.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let title: String
    let points: Int
    let url: String?
    let objectID: String
}
