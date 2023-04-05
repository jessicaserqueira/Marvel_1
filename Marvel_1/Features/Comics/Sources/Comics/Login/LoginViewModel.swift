//
//  File.swift
//  
//
//  Created by NMAS Amaral on 07/03/23.
//

import SwiftUI
import Common
import Domain

public class LoginViewModel: ObservableObject {
    private var coordinator: LoginCoordinating?
    @Published public var loginModel = LoginAuthenticationModel(email: "jessicaserqueira@gmail.com", password: "15ioasys@A")
    @AppStorage("uid") var userID = String()
    @Published public var formInvalid = false
    public var alertText = ""
    
    private lazy var loginPersistenceUseCase = DIContainer.shared.resolveSafe(Domain.LoginPersistenceUseCaseProtocol.self)
    
    private lazy var loginUseCase = DIContainer.shared.resolveSafe(Domain.LoginUseCaseProtocol.self)
    
    deinit{
        debugPrint("\(self) deinit")
    }
    
    public init(coordinator: LoginCoordinating) {
        self.coordinator = coordinator
    }
}

extension LoginViewModel: LoginModelling {

    
    public func loginAuthentication(email: String, password: String) {
        loginUseCase.loginAuthentication(email: loginModel.email, password: loginModel.password) { [weak self]
            result in
            switch result {
            case .success(()):
                self?.coordinator?.loginValidation(email: email, password: password)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    @MainActor public func createAccount() {
        print("criar conta")
        coordinator?.createAccount()
    }
}
