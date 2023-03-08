//
//  File.swift
//  
//
//  Created by NMAS Amaral on 08/03/23.
//

import SwiftUI
import Common
import Domain
import Firebase

@available(iOS 14.0, *)
public class CreateAccountModel: ObservableObject {
    private var coordinator: CreateAccountCoordinating?
    @State private var email: String = ""
    @State private var password: String = ""
    @AppStorage("uid") var userID = String()
    
    public init(coordinator: CreateAccountCoordinating) {
        self.coordinator = coordinator
    }
}

@available(iOS 14.0, *)
extension CreateAccountModel: CreateAccountModelling {
    
    public func returnLoginView() {
        print("return")
    }
    
    public func createAccount() {
        print("criou conta")
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
