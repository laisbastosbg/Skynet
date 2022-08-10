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
    let users = await API.getUsers()
    print(users)
  }
}
