//
//  File.swift
//  
//
//  Created by NMAS Amaral on 17/03/23.
//

import Foundation
import Common
import Domain

public class LoginPersistenceViewModel: ObservableObject {
    private var coordinator: LoginPersistenceCoordinating?
    private lazy var loginPersistenceUseCase = DIContainer.shared.resolveSafe(Domain.LoginPersistenceUseCaseProtocol.self)
    @Published public var isLogged = false
    
    public init(coordinator: LoginPersistenceCoordinating) {
        self.coordinator = coordinator
        self.loginPersistenceUseCase = loginPersistenceUseCase
    }
}

extension LoginPersistenceViewModel: LoginPersistenceModelling {
    
    public func onAppear() {
        loginPersistenceUseCase.loginValidation(isLogged: isLogged)
        coordinator?.isLogged(isLogged)
    }
}
