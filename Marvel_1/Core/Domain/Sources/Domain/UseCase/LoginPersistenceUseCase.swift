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
    
    public func loginValidation(isLogged: Bool) {
        loginPersistenceRepository.loginValidation(isLogged: isLogged)
    }
}
