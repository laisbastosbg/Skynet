//
//  PostService.swift
//  Skynet
//
//  Created by Lais Godinho on 16/08/22.
//

import Foundation

class PostService: API {
    static func getPosts() async -> [Post] {
            guard let url = URL(string: "http://localhost:8080/posts") else { fatalError("missing url") }

            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                print(data)
                let posts = try JSONDecoder().decode([Post].self, from: data)

                return posts
            } catch {
                print(error)
            }

            return []
        }
    
    static func setPost(_ post: Post.create, _ contentType: String, _ token: String) async throws -> Post {
        var urlRequest = URLRequest(url: URL(string: "\(baseURL)/posts")!)
        
        urlRequest.httpMethod = "POST"
        urlRequest.allHTTPHeaderFields = [
            "Content-Type": contentType,
        ]
        
        urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        urlRequest.httpBody = try JSONEncoder().encode(post)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        if let responseHeader = response as? HTTPURLResponse {
            print("status: \(responseHeader.statusCode)")
        }
        
        let post = try JSONDecoder().decode(Post.self, from: data)
        
        return post
    }
}
