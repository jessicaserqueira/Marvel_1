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
    
    public func loginValidation(isLogged: Bool) {
        remote.loginValidation(isLogged: isLogged)
    }
}
