//
//  API.swift
//  Skynet
//
//  Created by Lais Godinho on 10/08/22.
//

import Foundation

class API {
    static func getUsers() async -> [User] {
        guard let url = URL(string: "http://localhost:8080/users") else { fatalError("missing url") }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            print(data)
            let users = try JSONDecoder().decode([User].self, from: data)
            
            return users
        } catch {
            print(error)
        }
        
        return []
    }
}
