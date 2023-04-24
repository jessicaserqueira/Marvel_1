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
    
    // MARK: - LoginCoordinator
    func makeLoginCoordinator() -> Comics.LoginCoordinator {
        container.resolveSafe(LoginCoordinator.self)
    }
    
    // MARK: CreateAccountCoordinator
    func makeCreateAccountCoordinator() -> Comics.CreateAccountCoordinator {
        container.resolveSafe(CreateAccountCoordinator.self)
    }
    
    // MARK: - TabBarCoordinator
    
    func makeTabBarCoordinator() -> Comics.TabBarCoordinator {
        container.resolveSafe(TabBarCoordinator.self)
    }
    
    // MARK: - CharacterCoordinator
    func makeCharacterCoordinator() -> Comics.CharacterHomeCoordinator {
        container.resolveSafe(CharacterHomeCoordinator.self)
    }
    // MARK: - ScreenDetailsCoordinator
    func makeScreenDetailsCoordinator() -> Comics.DetailsCharacterCoordinator {
        container.resolveSafe(DetailsCharacterCoordinator.self)
    }
}
