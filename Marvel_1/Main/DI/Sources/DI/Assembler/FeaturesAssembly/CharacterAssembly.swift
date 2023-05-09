//
//  File.swift
//  
//
//  Created by NMAS Amaral on 23/12/22.
//
//
import Foundation
import Comics
import SwiftUI
import Swinject

class CharacterAssembly: Assembly {
    
    func assemble(container: Container) {
    
        let characterCoordinator = container.resolveSafe(CharacterHomeCoordinator.self)
        container.register(CharacterHomeCoordinating.self) { _ in characterCoordinator }
        
        container.autoregister((any CharacterHomeModelling).self, initializer: CharacterHomeViewModel.init)
    }
}
