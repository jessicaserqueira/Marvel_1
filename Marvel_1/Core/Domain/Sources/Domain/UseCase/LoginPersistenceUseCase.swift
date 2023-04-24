//
//  File.swift
//  
//
//  Created by NMAS Amaral on 21/03/23.
//

import Foundation

public class LoginPersistenceUseCase {
    private let loginPersistenceRepository: LoginPersistenceRepository
    
    public init(loginPersistenceRepository: LoginPersistenceRepository) {
        self.loginPersistenceRepository = loginPersistenceRepository
    }
}

extension LoginPersistenceUseCase: LoginPersistenceUseCaseProtocol {
    public var userID: String? {
        loginPersistenceRepository.userID ?? ""
        
    }
    
    public var isLogged: Bool {
        loginPersistenceRepository.isLogged
    }
    
    
    public func loginValidation() {
        loginPersistenceRepository.loginValidation()
    }
    
    public func logout() {
        loginPersistenceRepository.logout()
    }
}
