//
//  MockLoginCoordinator.swift
//  
//
//  Created by Jessica Serqueira on 28/04/23.
//

import Common
import Domain
import Comics

class MockLoginCoordinator: LoginCoordinating {
    
    var didCallLoginValidation = false
       var didCallCreateAccount = false
       var email: String?
       var password: String?

       func loginValidation(email: String, password: String) {
           didCallLoginValidation = true
           self.email = email
           self.password = password
       }

       func createAccount() {
           didCallCreateAccount = true
       }
   }
