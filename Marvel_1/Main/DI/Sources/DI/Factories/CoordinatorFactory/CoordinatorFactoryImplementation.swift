//
//  File.swift
//  
//
//  Created by NMAS Amaral on 22/12/22.
//

import Common
import Comics
import AppNavigation

@available(iOS 14.0, *)
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
    
    // MARK: - ScreenDetailsCoordinator
    func makeScreenDetailsCoordinator() -> Comics.DetailsCharacterCoordinator {
        container.resolveSafe(DetailsCharacterCoordinator.self)
    }
    
    func makeContentViewCoordinator() -> Comics.ContentViewCoordinator {
        container.resolveSafe(ContentViewCoordinator.self)
    }
}
