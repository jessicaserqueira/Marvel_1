//
//  File.swift
//  
//
//  Created by NMAS Amaral on 21/03/23.
//

import Foundation
import Domain

public class LoginPersistenceRepository {
    private let remote: LoginPersistenceDataSource
    
    public init(remote: LoginPersistenceDataSource) {
        self.remote = remote
    }
}

extension LoginPersistenceRepository: Domain.LoginPersistenceRepository {
    
    public var userID: String? {
        remote.userID ?? ""
    }
    
    
    public var isLogged: Bool {
        remote.isLogged
    }
    
    public func loginValidation() {
        remote.loginValidation()
    }
    
    public func logout() {
        remote.logout()
    }
}
