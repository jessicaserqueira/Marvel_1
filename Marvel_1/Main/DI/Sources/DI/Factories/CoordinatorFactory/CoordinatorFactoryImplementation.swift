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
    
    // MARK: - SplashCoordinator
    func makeSplashCoordinator() -> Comics.SplashScreenCoordinator {
        container.resolveSafe(SplashScreenCoordinator.self)
    }
    
    // MARK: - CharacterCoordinator
    func makeCharacterCoordinator() -> Comics.CharacterHomeCoordinator {
        container.resolveSafe(CharacterHomeCoordinator.self)
    }
}
