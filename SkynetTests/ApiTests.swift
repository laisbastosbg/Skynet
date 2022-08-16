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

        let users = await API.getUsers()

        XCTAssertEqual(users.count, 3)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
