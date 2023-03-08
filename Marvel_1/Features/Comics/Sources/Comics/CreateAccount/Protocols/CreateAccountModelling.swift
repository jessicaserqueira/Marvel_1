//
//  File.swift
//  
//
//  Created by NMAS Amaral on 08/03/23.
//

import SwiftUI

@MainActor
public protocol CreateAccountModelling: ObservableObject {
    
    func returnLoginView()
    func createAccount()
}
