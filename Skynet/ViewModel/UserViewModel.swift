//
//  UserViewModel.swift
//  Skynet
//
//  Created by Lais Godinho on 10/08/22.
//

import Foundation

class UserViewModel {
    func fetchUsers() async {
        UserService.getUsers { (users) in
            print(users)
        }
    }
    
    func addUser(user: User) async {
        do {
            let createdUser = try await UserService.setUser(user: user)
            print(createdUser)
        } catch {
            print("Algo deu errado: \(error)" )
        }
    }
    
    func login(user: User.authentication) async {
        do {
            let responseData = try await UserService.authenticateUser(user: user)
            print(responseData)
            
            
            let accessToken = responseData.token
            let data = Data(accessToken.utf8)
            KeychainHelper.standard.save(data, service: "access-token", account: "skynet")
            
            // precisa ser feito um tratamento pro caso de não existir o token na keychain
            let readData = KeychainHelper.standard.read(service: "access-token", account: "skynet")!
            let readAccessToken = String(data: readData, encoding: .utf8)!
            print("token: \(readAccessToken)")
        } catch {
            print("Algo deu errado: \(error)" )
        }
    }
    
    func logout(token: String) async {
        do {
            let responseData = try await UserService.logout(token: token)
            print(responseData)
        } catch {
            print("Algo deu errado no logout: \(error)" )
        }
    }
}
