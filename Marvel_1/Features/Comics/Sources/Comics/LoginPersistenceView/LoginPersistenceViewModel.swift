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
    @Published public var userID: String = ""
    
    public init(coordinator: LoginPersistenceCoordinating) {
        self.coordinator = coordinator
        self.loginPersistenceUseCase = loginPersistenceUseCase
    }
}

extension LoginPersistenceViewModel: LoginPersistenceModelling {
    
    public func onAppear() {
        
        let isLogged = loginPersistenceUseCase.isLogged
        userID = loginPersistenceUseCase.userID ?? ""
        coordinator?.isLogged(isLogged)
                loginPersistenceUseCase.loginValidation()
//                coordinator?.isLogged(isLogged, userID: userID)
    }
    
    public func logout() {
        loginPersistenceUseCase.logout()
        coordinator?.isLogged(false)
        coordinator?.logout()
    }
}
