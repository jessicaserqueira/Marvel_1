//
//  File.swift
//  
//
//  Created by NMAS Amaral on 21/03/23.
//

import Foundation
import FirebaseAuth

public class LoginPersistenceService {
    var isLogged = Auth.auth().currentUser != nil
    
    public init() {}
    
    public func loginValidation() {
        Auth.auth().addStateDidChangeListener { auth, user in
            self.isLogged = user != nil
        }
    }
}
