//
//  File.swift
//  
//
//  Created by NMAS Amaral on 21/03/23.
//

import Foundation
import AppData

public class LoginPersistenceDataSource {
    public let loginPresistenceService: LoginPersistenceService
    
    public init(loginPresistenceService: LoginPersistenceService) {
        self.loginPresistenceService = loginPresistenceService
    }
}

extension LoginPersistenceDataSource: AppData.LoginPersistenceDataSource {
    public func loginValidation(isLogged: Bool) {
        loginPresistenceService.loginValidation()
    }
}
