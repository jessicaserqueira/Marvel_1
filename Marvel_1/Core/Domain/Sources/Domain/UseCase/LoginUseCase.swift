//
//  File.swift
//  
//
//  Created by NMAS Amaral on 22/03/23.
//

import Foundation

public class LoginUseCase {
    private let loginRepository: LoginRepository
    
    public init(loginRepository: LoginRepository) {
        self.loginRepository = loginRepository
    }
}

extension LoginUseCase: LoginUseCaseProtocol {
    public func loginAuthentication(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        loginRepository.loginAuthentication(email: email, password: password, completion: completion)
    }
}
