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
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error)
                completion(.failure(error))
            } else {
                guard let user = result?.user else {
                    completion(.failure(NSError(domain: "", code: 0, userInfo: nil)))
                    return
                }
                print("usuario logado \(user.uid)")
                completion(.success(()))
            }
        }
    }
    
    public func signOut() {
        try! Auth.auth().signOut()
    }
}
