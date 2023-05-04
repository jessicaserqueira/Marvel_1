//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 03/05/23.
//
import Foundation
import Common
import Comics
import Domain
import SwiftUI

class LoginAssembly: Assembly {
    
    func assemble(container: Common.DIContainer) {
        
        let loginCoordinator = container.resolveSafe(LoginCoordinator.self)
        
        container.register(type: (any LoginModelling).self,
                           component: LoginViewModel(coordinator: loginCoordinator))
        container.resolve(type: LoginPersistenceUseCaseProtocol.self)
    }
}
