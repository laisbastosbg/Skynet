//
//  Model.swift
//  SkynetTests
//
//  Created by Moyses Miranda do Vale Azevedo on 11/08/22.
//

import Foundation
import XCTest
@testable import Skynet


class ModelTests: XCTestCase {
    func testUserModel() throws {
        let user = User(id: "akjsfajsfja", name: "Moyses", email: "m.mirazev@gmail.com", password: "senha123")
        XCTAssert(user.name == "Moyses", "error - User Name")
        XCTAssert(user.email == "m.mirazev@gmail.com", "error - User Email")
        XCTAssert(user.password == "senha123", "error - User Password")
    }
}
