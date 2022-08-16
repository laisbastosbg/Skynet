//
//  User.swift
//  Skynet
//
//  Created by Lais Godinho on 10/08/22.
//

import Foundation

struct User: Codable, Equatable {
    let id: String?
    let name: String
    let email: String
    let password: String?
}

extension User {
    struct withToken: Codable, Equatable {
        let token: String
        let user: User
    }
    
    struct authentication: Codable, Equatable {
        let username: String
        let password: String
    }
}
