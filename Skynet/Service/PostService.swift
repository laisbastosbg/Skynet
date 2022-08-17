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
}
