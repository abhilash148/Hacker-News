//
//  NetworkManager.swift
//  Hacker News
//
//  Created by Sai Abhilash Gudavalli on 03/07/22.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { [weak self] (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self?.posts = results.hits
                            }
                        } catch {
                            print("Abhilash failed to decode data - \(error)")
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
