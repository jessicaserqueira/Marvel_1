//
//  File.swift
//  
//
//  Created by NMAS Amaral on 21/03/23.
//

import Foundation
import AppData

@available(iOS 14.0, *)
public class LoginPersistenceDataSource {
    public let loginPresistenceService: LoginPersistenceService
    
    public init(loginPresistenceService: LoginPersistenceService) {
        self.loginPresistenceService = loginPresistenceService
    }
}

@available(iOS 14.0, *)
extension LoginPersistenceDataSource: AppData.LoginPersistenceDataSource {
    
    public var userID: String? {
        loginPresistenceService.userID ?? ""
    }
    
    public var isLogged: Bool {
        loginPresistenceService.isLogged
    }
    
    public func loginValidation() {
        loginPresistenceService.loginValidation()
    }
    
    public func logout() {
        loginPresistenceService.logout()
    }
}
