//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 20/04/23.
//

import AppData
import Foundation
import UIKit

public class CreateAccountRemoteDataSource: AppData.CreateAccountRemoteDataSource {
    
    let createAccountService: CreateAccountService
    
    @Published public var formInvalid = false
    public var alertText = ""
    
    public init(createAccountService: CreateAccountService) {
        self.createAccountService = createAccountService

    }
}

extension CreateAccountRemoteDataSource {
    public func signUp(withEmail email: String, password: String, image: UIImage, name: String, completion: @escaping (String?) -> Void) {
        print("nome: \(name), email: \(email), senha: \(password)")
        
        if (image.size.width <= 0) {
            formInvalid = true
            alertText = "Selecione uma foto"
            return
        }
        
        createAccountService.signUp(withEmail: email, password: password, image: image, name: name) { error in
            if let error = error {
                self.formInvalid = true
                self.alertText = error
                print(error)
            }
        }
    }
}
