//
//  File.swift
//  
//
//  Created by NMAS Amaral on 07/03/23.
//

import SwiftUI
import Common
import Domain

@available(iOS 14.0, *)
public class LoginViewModel: ObservableObject {
    private var coordinator: LoginCoordinating?
    @Published public var loginModel = LoginAuthenticationModel(email: "", password: "")
    @AppStorage("uid") var userID = String()
    @Published public var formInvalid = false
    public var alertText = ""
    private lazy var loginUseCase = DIContainer.shared.resolveSafe(Domain.LoginUseCaseProtocol.self)
    
    
    public init(coordinator: LoginCoordinating) {
        self.coordinator = coordinator
        self.loginUseCase = loginUseCase
    }
}

@available(iOS 14.0, *)
extension LoginViewModel: LoginModelling {
    public func loginButton(email: String, password: String) {
        loginUseCase.loginAuthentication(email: loginModel.email, password: loginModel.password) {
            result in
            switch result {
            case .success(()):
                self.coordinator?.loginButton(email: email, password: password)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    public func loginAuthentication(email: String, password: String) {
        
    }
    
    
    @MainActor public func createAccount() {
        print("criar conta")
        coordinator?.createAccount()
    }
}
