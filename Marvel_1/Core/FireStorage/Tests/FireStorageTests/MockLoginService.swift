//
//  MockLoginService.swift
//  
//
//  Created by Jessica Serqueira on 27/04/23.
//

import XCTest
@testable import FireStorage

protocol LoginServiceProtocol {
    func loginAuthentication(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void)
}

class MockLoginService: LoginServiceProtocol {
    func loginAuthentication(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        if email == "test@example.com" && password == "invalidpassword" {
            completion(.failure(NSError(domain: "Test", code: 404, userInfo: nil)))
        } else {
            completion(.success(true))
        }
    }
}
