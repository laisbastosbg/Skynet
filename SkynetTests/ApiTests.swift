//
//  TestAPI.swift
//  SkynetTests
//
//  Created by Moyses Miranda do Vale Azevedo on 11/08/22.
//

import XCTest
import Mocker
@testable import Skynet

class ApiTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetUsers() async throws {
        
        let url = URL(string: "http://localhost:8080/users")!
        
        let mockedUsers = [
            User(id: "kanflkanflkna", name: "Lorem Ipsum 1", email: "loremipsum1@mail.com", password: nil),
            User(id: "kanflkanflkna", name: "Lorem Ipsum 2", email: "loremipsum2@mail.com", password: nil),
            User(id: "kanflkanflkna", name: "Lorem Ipsum 3", email: "loremipsum3@mail.com", password: nil)
        ]
        
        let mock = Mock(
            url: url,
            dataType: .json,
            statusCode: 200,
            data: [
                .get : try! JSONEncoder().encode(mockedUsers)
            ]
        )
        
        mock.register() // quando o mock é registrado, as requisições passam a não alcançar o servidor
        
        UserService.getUsers { users in
            XCTAssertEqual(users.count, 3)
        }
    }
    
    func testSetUser() async throws {
        let url = URL(string: "http://localhost:8080/users")!
        
        let mockedUser = User(id: "asdaksdj", name: "Mafalda", email: "mafalda@gmail.com", password: "senhadamafalda")
        let mockedCreatedUserResponse = User.withToken(token: "alsfhaofo", user: mockedUser)
        
        let mock = Mock(url: url, dataType: .json, statusCode: 200, data: [
            .post: try! JSONEncoder().encode(mockedCreatedUserResponse)
        ])
        
        mock.register()
        
        let expected = mockedCreatedUserResponse
        let output = try! await UserService.setUser(user: mockedUser)
        
        XCTAssertEqual(expected, output)
    }
    
    func testAuthenticateUser() async throws {
        let url = URL(string: "http://localhost:8080/users/login")!
    
        let mockedUser = User.authentication(username: "mafalda@gmail.com", password: "senhadamafalda")
        
        let mockedUserResponse = User(id: "asdaksdj", name: "Mafalda", email: "mafalda@gmail.com", password: "senhadamafalda")
        let mockedCreatedUserResponse = User.withToken(token: "alsfhaofo", user: mockedUserResponse)
        
        let mock = Mock(url: url, dataType: .json, statusCode: 200, data: [
            .post: try! JSONEncoder().encode(mockedCreatedUserResponse)
        ])
        
        mock.register()
        
        let expected = mockedCreatedUserResponse
        let output = try! await UserService.authenticateUser(user: mockedUser)
        
        XCTAssertEqual(expected, output)
    }
    
    func testLogoutUser() async throws {
        let url = URL(string: "http://localhost:8080/users/logout")!
        
        let mockedToken = "alsfhaofo"
        let mockedUser = User(id: "asdaksdj", name: "Mafalda", email: "mafalda@gmail.com", password: "senhadamafalda")
        let mockedCreatedUserResponse = User.withToken(token: "alsfhaofo", user: mockedUser)
        
        let mock = Mock(url: url, dataType: .json, statusCode: 200, data: [
            .post: try! JSONEncoder().encode(mockedCreatedUserResponse)
        ])
        
        mock.register()
        
        let expected = 200
        let output = try! await UserService.logout(token: mockedToken)
        
        XCTAssertEqual(expected, output)
    }
    
    func testGetPosts() async throws {
        
        let url = URL(string: "http://localhost:8080/posts")!
        
        let mockedPosts = [
            Post(id: "033FA82F-078F-4DD9-B5D5-7B1E18F66808", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", media: nil, like_count: 0, user_id: "62AD71E6-78CC-47D9-A6B0-FAE4F654F6C3", created_at: "2022-08-16T17:26:40Z", updated_at: nil)
        ]
        
        let mock = Mock(
            url: url,
            dataType: .json,
            statusCode: 200,
            data: [
                .get : try! JSONEncoder().encode(mockedPosts)
            ]
        )
        
        mock.register()
        
        let expected = mockedPosts
        
        let output = await PostService.getPosts()
        
        XCTAssertEqual(expected, output)
    }
}
