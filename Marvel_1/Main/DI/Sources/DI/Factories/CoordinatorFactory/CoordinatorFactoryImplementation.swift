//
//  File.swift
//  
//
//  Created by NMAS Amaral on 22/12/22.
//

import Common
import Comics
import AppNavigation
import Swinject

class CoordinatorFactoryImplementation: CoordinatorFactory {
    
    private let container: Resolver
    
    required init(container: Resolver) {
        self.container = container
    }
    
    // MARK: - SplashCoordinator
    func makeSplashCoordinator() -> Comics.SplashScreenCoordinator {
        guard let coordinator =  container.resolve(SplashScreenCoordinator.self) else {
            preconditionFailure("WalletCoordinator is nil")
        }
        return coordinator
    }
    
    // MARK: - LoginCoordinator
    func makeLoginCoordinator() -> Comics.LoginCoordinator {
       guard let coordinator =  container.resolve(LoginCoordinator.self)  else {
            preconditionFailure("WalletCoordinator is nil")
        }
        return coordinator
    }
    
    // MARK: - CreateAccountCoordinator
    func makeCreateAccountCoordinator() -> Comics.CreateAccountCoordinator {
        guard let coordinator =  container.resolve(CreateAccountCoordinator.self)  else {
             preconditionFailure("WalletCoordinator is nil")
         }
         return coordinator
    }
    
    // MARK: - TabBarCoordinator
    func makeTabBarCoordinator() -> Comics.TabBarCoordinator {
        guard let coordinator =  container.resolve(TabBarCoordinator.self)  else {
             preconditionFailure("WalletCoordinator is nil")
         }
         return coordinator
    }
    
    // MARK: - CharacterCoordinator
    func makeCharacterCoordinator() -> Comics.CharacterHomeCoordinator {
        guard let coordinator =  container.resolve(CharacterHomeCoordinator.self)  else {
             preconditionFailure("WalletCoordinator is nil")
         }
         return coordinator
    }
    
    // MARK: - ScreenDetailsCoordinator
    func makeScreenDetailsCoordinator() -> Comics.DetailsCharacterCoordinator {
        guard let coordinator =  container.resolve(DetailsCharacterCoordinator.self)  else {
             preconditionFailure("WalletCoordinator is nil")
         }
         return coordinator
    }
    // MARK: - ScreenDetailsComicsCoordinator
    func makeScreenDetailsComicsCoordinator() -> Comics.DetailsComicsCoordinator {
        guard let coordinator =  container.resolve(DetailsComicsCoordinator.self)  else {
             preconditionFailure("WalletCoordinator is nil")
         }
         return coordinator
    }
    
    // MARK: - ComicsCoordinator
    func makeComicsCoordinator() -> Comics.ComicsCoordinator {
        guard let coordinator =  container.resolve(ComicsCoordinator.self)  else {
             preconditionFailure("WalletCoordinator is nil")
         }
         return coordinator
    }
    
    // MARK: - FavoritesCoordinator
    func makeFavoritesCoordinator() -> Comics.FavoritesCoordinator {
        guard let coordinator =  container.resolve(FavoritesCoordinator.self)  else {
             preconditionFailure("WalletCoordinator is nil")
         }
         return coordinator
    }
}
