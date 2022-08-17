//
//  PostViewModel.swift
//  Skynet
//
//  Created by Lais Godinho on 17/08/22.
//

import Foundation

class PostViewModel {
    func fetchPosts() async {
        let posts = await PostService.getPosts()
        print(posts)
    }
}
