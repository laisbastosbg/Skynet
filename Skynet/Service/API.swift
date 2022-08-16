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

    static func setUser(user: User) async throws -> User.createResponse {
            var urlRequest = URLRequest(url: URL(string: "http://localhost:8080/users")!)
            //Tratar
            urlRequest.httpMethod = "POST"
            urlRequest.allHTTPHeaderFields = [
                "Content-Type": "application/json",
            ]

//            do {
                urlRequest.httpBody = try JSONEncoder().encode(user)
                let (data, _) = try await URLSession.shared.data(for: urlRequest)
                
                let user = try JSONDecoder().decode(User.createResponse.self, from: data)
                
                return user
//                if let responseHeader = response as? HTTPURLResponse {
//                    return (responseHeader.statusCode == 200)
//                }
//            } catch {
//                print(error)
//            }
        }



}
