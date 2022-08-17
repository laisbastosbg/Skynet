//
//  Post.swift
//  Skynet
//
//  Created by Lais Godinho on 16/08/22.
//

import Foundation

struct Post: Codable, Equatable {
    let id: String
    let content: String
    let media: String?
    let like_count: Int?
    let user_id: String
    let created_at: String
    let updated_at: String?
}
