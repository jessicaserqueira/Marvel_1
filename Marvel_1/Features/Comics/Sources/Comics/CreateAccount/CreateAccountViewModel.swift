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
    @Published public var formInvalid = false
    public var alertText = ""
    
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
    
    public func dismissModal() {
        coordinator?.dismissModal()
    }
    
    public var validData: Bool {
        return !createAccount.email.isEmpty
    }

    public func buttonCreateAccount() {
        Auth.auth().createUser(withEmail: createAccount.email, password: createAccount.password) { authResult, error in
            
            guard let user = authResult?.user, error == nil else {
                self.formInvalid = true
                self.alertText = error!.localizedDescription
                print(error!)
                return
            }

            if let authResult = authResult {
                print(authResult.user.uid)
                self.userID = authResult.user.uid
            }
        }
    }
}
