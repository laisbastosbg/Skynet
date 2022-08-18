//
//  PostViewModel.swift
//  Skynet
//
//  Created by Lais Godinho on 17/08/22.
//

import Foundation

class PostViewModel {
    func fetchPosts() async -> [Post] {
        let posts = await PostService.getPosts()
        return posts
    }
    
    func addPost(_ post: Post.create, _ contentType: String, _ token: String) async {
        do {
            let createdPost = try await PostService.setPost(post, contentType, token)
            
            print(createdPost)
        } catch {
            print("Algo deu errado: \(error)")
        }
    }
}
