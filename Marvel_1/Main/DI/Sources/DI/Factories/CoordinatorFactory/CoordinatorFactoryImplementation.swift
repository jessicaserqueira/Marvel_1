//
//  File.swift
//  
//
//  Created by NMAS Amaral on 22/12/22.
//

import Common
import Comics
import AppNavigation

class CoordinatorFactoryImplementation: CoordinatorFactory {
    
    private let container: DIContainer
    
    required init(container: DIContainer) {
        self.container = container
    }
    
    func makeCharacterCoordinator() -> Comics.SplashScreenCoordinator {
        container.resolveSafe(SplashScreenCoordinator.self)
    }
}
