//
//  File.swift
//  
//
//  Created by NMAS Amaral on 07/03/23.
//

public protocol LoginCoordinating {
    
    func loginValidation(email: String, password: String)
    func createAccount()
}
