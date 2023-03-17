//
//  File.swift
//  
//
//  Created by NMAS Amaral on 07/03/23.
//

import SwiftUI
import Common
import Domain
import FirebaseAuth

@available(iOS 14.0, *)
public class LoginViewModel: ObservableObject {
    private var coordinator: LoginCoordinating?
    @Published public var loginModel = LoginAuthenticationModel(email: "", password: "")
    @AppStorage("uid") var userID = String()
    @Published public var formInvalid = false
    public var alertText = ""
    
    
    public init(coordinator: LoginCoordinating) {
        self.coordinator = coordinator
    }
}

@available(iOS 14.0, *)
extension LoginViewModel: LoginModelling {
    
    @MainActor public func createAccount() {
        print("criar conta")
        coordinator?.createAccount()
    }
    
    public func loginButton() {
        Auth.auth().signIn(withEmail: loginModel.email, password: loginModel.password) { authResult, error in
            
            guard let user = authResult?.user, error == nil else {
                self.formInvalid = true
                self.alertText = error!.localizedDescription
                print(error!)
                return
            }

            if let authResult = authResult {
                print("Sucesso")
                print(authResult.user.uid)
                withAnimation {
                    self.userID = authResult.user.uid
                }
                self.coordinator?.loginButton()
            }
        }
    }
}
