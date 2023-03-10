//
//  File.swift
//  
//
//  Created by NMAS Amaral on 07/03/23.
//

import SwiftUI

@MainActor
public protocol LoginModelling: ObservableObject {
    var loginModel: LoginAuthenticationModel { get set }
    
    func loginButton()
    func createAccount()
}
