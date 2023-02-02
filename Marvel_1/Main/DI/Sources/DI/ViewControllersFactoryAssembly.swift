//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 02/02/23.
//


import Common
import Comics

class ViewControllersFactoryAssembly: Assembly {
    
    func assemble(container: DIContainer) {
        container.register(type: CharacterViewControllersFactory.self, component: CharacterFactoryImplementation(container: container))
    }
}
