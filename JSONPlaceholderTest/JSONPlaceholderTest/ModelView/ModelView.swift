//
//  ModelView.swift
//  JSONPlaceholderTest
//

import Foundation

struct Post: Codable, Identifiable{
    
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
}

func fetchPosts(completion: @escaping ([Post]) -> Void) {
    
    let urlString = "https://jsonplaceholder.typicode.com/posts"
    
    guard let url = URL(string: urlString) else {
        print("Invalid URL")
        return
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("Error fetching posts: \(error)")
            return
        }
        
        guard let data = data else {
            print("No data received")
            return
        }
        
        do {
            let posts = try JSONDecoder().decode([Post].self, from: data)
            DispatchQueue.main.async {
                completion(posts)
            }
        } catch {
            print("Error decoding posts: \(error)")
        }
    }.resume()
}



