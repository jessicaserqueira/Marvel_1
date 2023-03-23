//
//  File.swift
//  
//
//  Created by NMAS Amaral on 22/03/23.
//

import Foundation
import AppData
import Common
import FirebaseAuth

@available(iOS 14.0, *)
public class LoginDataSource {
    private let loginService: LoginService
    
    public init(loginService: LoginService) {
        self.loginService = loginService
    }
}

@available(iOS 14.0, *)
extension LoginDataSource: AppData.LoginDataSource {
    public func loginAuthentication(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        loginService.loginAuthentication(email: email, password: password) { result in
            switch result {
            case .success(_):
                completion(.success(()))
            case .failure(let error):
                print("\(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
    
    public func signOut() {
        loginService.signOut()
    }
}
