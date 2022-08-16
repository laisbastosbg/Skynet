//
//  API.swift
//  Skynet
//
//  Created by Lais Godinho on 10/08/22.
//

import Foundation

class API {
    static func getUsers(completion: @escaping ([User]) -> ()) {
        guard let url = URL(string: "http://localhost:8080/users") else { fatalError("missing url") }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            let users = try! JSONDecoder().decode([User].self, from: data!)
            DispatchQueue.main.async {
                completion(users)
            }
        }
        .resume()
    }
    
    static func setUser(user: User) async throws -> User.withToken {
        var urlRequest = URLRequest(url: URL(string: "http://localhost:8080/users")!)
        //Tratar
        urlRequest.httpMethod = "POST"
        urlRequest.allHTTPHeaderFields = [
            "Content-Type": "application/json",
        ]
        
        urlRequest.httpBody = try JSONEncoder().encode(user)
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        let user = try JSONDecoder().decode(User.withToken.self, from: data)
        
        return user
    }
    
    static func authenticateUser(user: User.authentication) async throws -> User.withToken {
        let loginString = "\(user.username):\(user.password)"
        
        guard let loginData = loginString.data(using:String.Encoding.utf8) else {
            fatalError("Nome de usuario ou senha invalidos")
        }
        
        let base64LoginString = loginData.base64EncodedString()
        var urlRequest = URLRequest(url: URL(string: "http://localhost:8080/users/login")!)
        
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")

        urlRequest.httpBody = try JSONEncoder().encode(user)
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        let user = try JSONDecoder().decode(User.withToken.self, from: data)
        
        return user
    }
}
