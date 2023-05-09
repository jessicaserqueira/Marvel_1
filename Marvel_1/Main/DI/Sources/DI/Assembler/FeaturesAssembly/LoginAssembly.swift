//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 05/05/23.
//

import Foundation
import Comics
import SwiftUI
import Swinject

class LoginAssembly: Assembly {
    
    func assemble(container: Container) {
    
        let loginCoordinator = container.resolveSafe(LoginCoordinator.self)
        container.register(LoginCoordinating.self) { _ in loginCoordinator }
        
        container.autoregister((any LoginModelling).self, initializer: LoginViewModel.init)
    }
}
