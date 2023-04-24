//
//  File.swift
//  
//
//  Created by NMAS Amaral on 08/03/23.
//

import SwiftUI

@MainActor
public protocol CreateAccountModelling: ObservableObject {
    var createAccount: CreateAccountModel { get set }
    var image: UIImage { get set }
    var formInvalid: Bool { get set }
    var alertText: String { get }
    var validData: Bool { get }
    var isLoading: Bool { get }
    
    func returnLoginView()
    func buttonCreateAccount()
    func dismissModal()
}
