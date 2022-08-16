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
    let created_at: Date
    let updated_at: Date?
}
