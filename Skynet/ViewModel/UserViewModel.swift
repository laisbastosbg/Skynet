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
    
    func fetchUserByID(id: String) async -> User? {
        do {
            let user = try await UserService.getUserByID(id: id)
            return user
        } catch {
            print("Erro: \(error)")
        }
        return nil
    }
    
    func addUser(user: User) async {
        do {
            let createdUser = try await UserService.setUser(user: user)
            print(createdUser)
        } catch {
            print("Algo deu errado: \(error)" )
        }
    }
    
    func login(user: User.authentication) async -> Int {
        do {
            let responseData = try await UserService.authenticateUser(user: user)
            print("responseData: \(responseData)")
            
            let statusCode = responseData.0
            
            if let responseBody = responseData.1 {
                let accessToken = responseBody.token
                let tokenData = Data(accessToken.utf8)
                KeychainHelper.standard.save(tokenData, service: "access-token", account: "skynet")
                
                let userID = responseBody.user.id!
                let userData = Data(userID.utf8)
                KeychainHelper.standard.save(userData, service: "user-id", account: "skynet")

                
            } else {
                if statusCode == 401 {
                    print("Login ou senha incorretos")
                }
            }
            
            return statusCode
            
        } catch {
            print("Algo deu errado: \(error)" )
            return 0
        }
    }
    
    func logout(token: String) async {
        do {
            let responseData = try await UserService.logout(token: token)
            print("responseData: \(responseData)")
        } catch {
            print("Algo deu errado no logout: \(error)" )
        }
    }
}
