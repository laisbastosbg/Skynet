//
//  UserViewModel.swift
//  Skynet
//
//  Created by Lais Godinho on 10/08/22.
//

import Foundation

class UserViewModel: ObservableObject {
    var users: [User] = []
    
    func fetchUsers() async {
        API.getUsers { (users) in
            print(users)
        }
    }
    
    func addUser(user: User) async {
        do {
            let createdUser = try await API.setUser(user: user)
            print(createdUser)
        } catch {
            print("Algo deu errado: \(error)" )
        }
    }
    
}
