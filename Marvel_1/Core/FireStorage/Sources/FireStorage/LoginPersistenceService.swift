//
//  File.swift
//  
//
//  Created by NMAS Amaral on 21/03/23.
//

import Foundation
import FirebaseAuth
import SwiftUI

public class LoginPersistenceService {
    
    public init() {}
    
    var userID: String? {
        return Auth.auth().currentUser?.uid
    }
    var isLogged = Auth.auth().currentUser != nil
    
    public func loginValidation() {
        Auth.auth().addStateDidChangeListener { auth, user in
            self.isLogged = user != nil
        }
    }
    
    public func logout() {
        do {
            try Auth.auth().signOut()
         
        } catch {
            print("Erro ao fazer logout: \(error.localizedDescription)")
        }
    }
}
