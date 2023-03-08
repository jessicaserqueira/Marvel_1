//
//  File.swift
//  
//
//  Created by NMAS Amaral on 07/03/23.
//

import SwiftUI
import Common
import Domain
import Firebase

@available(iOS 14.0, *)
public class LoginViewModel: ObservableObject {
    private var coordinator: LoginCoordinating?
    @State private var email: String = ""
    @State private var password: String = ""
    @AppStorage("uid") var userID = String()
    
    public init(coordinator: LoginCoordinating) {
        self.coordinator = coordinator
    }
}

@available(iOS 14.0, *)
extension LoginViewModel: LoginModelling {
    
    public func createAccount() {
        print("criar conta")
    }
    
    public func loginButton() {
        print("Entrou")
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error)
                return
            }
            if let authResult = authResult {
                print(authResult.user.uid)
                withAnimation {
                    self.userID = authResult.user.uid
                }
            }
        }
    }
}
