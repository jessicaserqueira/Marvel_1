//
//  File.swift
//  
//
//  Created by NMAS Amaral on 17/03/23.
//

import Foundation
import FirebaseAuth
import Firebase
import Common

public class LoginPersistenceViewModel: ObservableObject {
    private var coordinator: LoginPersistenceCoordinating?
    @Published public var isLogged = Auth.auth().currentUser != nil
    
    public init(coordinator: LoginPersistenceCoordinating) {
        self.coordinator = coordinator
    }
}

extension LoginPersistenceViewModel: LoginPersistenceModelling {
    public func onAppear() {
        Auth.auth().addStateDidChangeListener { auth, user in
            self.isLogged = user != nil
        }
    }
}
