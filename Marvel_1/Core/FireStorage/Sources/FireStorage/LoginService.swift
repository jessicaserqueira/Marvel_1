//
//  File.swift
//  
//
//  Created by NMAS Amaral on 22/03/23.
//

import Foundation
import FirebaseAuth
import AppData
import SwiftUI

@available(iOS 14.0, *)
public class LoginService {
    @AppStorage("uid") var userID = String()
    
    public init() {
        
    }
    
    func loginAuthentication(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Os dados fornecidos são inválidos.")
                print(error)
                completion(.failure(error))
                return
            }

            print("Sucesso")
            print(authResult?.user.uid ?? "")
            withAnimation {
                self.userID = authResult?.user.uid ?? ""
            }
            completion(.success(()))
        }
    }
}
