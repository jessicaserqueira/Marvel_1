//
//  File.swift
//  
//
//  Created by NMAS Amaral on 23/12/22.
//
//
import Foundation
import Common
import Comics
import Domain
import SwiftUI

class CharacterAssembly: Assembly {
    
    func assemble(container: Common.DIContainer) {
        
        let characterCoordinator = container.resolveSafe(CharacterHomeCoordinator.self)
        
        container.register(type: CharacterHomeCoordinating.self, component: characterCoordinator)
    }
}
