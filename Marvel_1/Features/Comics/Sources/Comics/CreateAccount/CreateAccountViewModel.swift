//
//  File.swift
//  
//
//  Created by NMAS Amaral on 08/03/23.
//

import SwiftUI
import Common
import Domain
import FirebaseAuth

@available(iOS 14.0, *)
public class CreateAccountViewModel: ObservableObject {
    private var coordinator: CreateAccountCoordinating?
    @Published public var createAccount = CreateAccountModel(email: "", password: "")
    @AppStorage("uid") var userID = String()
    
    public init(coordinator: CreateAccountCoordinating) {
        self.coordinator = coordinator
    }
}

@available(iOS 14.0, *)
extension CreateAccountViewModel: CreateAccountModelling {
    
    public func returnLoginView() {
        print("return")
        coordinator?.returnLoginView()
    }
    
    public func buttonCreateAccount() {
        coordinator?.buttonCreateAccount()
        print("criou conta")

        guard self.createAccount.password.count >= 6 else {
            return
        }

        Auth.auth().createUser(withEmail: createAccount.email, password: createAccount.password) { authResult, error in

            if let error = error {
                debugPrint(error)
                return
            }

            if let authResult = authResult {
                print(authResult.user.uid)
                self.userID = authResult.user.uid
            }
        }
    }
}
