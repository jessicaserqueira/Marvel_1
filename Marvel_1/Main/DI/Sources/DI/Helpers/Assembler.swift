//
//  File.swift
//  
//
//  Created by NMAS Amaral on 16/12/22.
//

import Common

class Assembler {
    
    private let container: DIContainer
    
    var resolver: DIContainer {
        return container
    }
    
    init(_ assemblies: [Assembly], container: DIContainer = DIContainer.shared) {
        self.container = container
        run(assemblies: assemblies)
    }
    
    private func run(assemblies: [Assembly]) {
        
        for assembly in assemblies {
            assembly.assemble(container: container)
        }
    }
}
