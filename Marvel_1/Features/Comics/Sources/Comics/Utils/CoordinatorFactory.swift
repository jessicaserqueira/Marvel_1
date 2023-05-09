//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 05/05/23.
//

import Foundation

public protocol CoordinatorFactory: DependencyFactory {
    
    func makeSplashCoordinator() -> SplashScreenCoordinator
    func makeLoginCoordinator() -> LoginCoordinator
    func makeCreateAccountCoordinator() -> CreateAccountCoordinator
    func makeTabBarCoordinator() -> TabBarCoordinator
    func makeScreenDetailsCoordinator() -> DetailsCharacterCoordinator
    func makeScreenDetailsComicsCoordinator() -> DetailsComicsCoordinator
    func makeCharacterCoordinator() -> CharacterHomeCoordinator
    func makeComicsCoordinator() -> ComicsCoordinator
    func makeFavoritesCoordinator() -> FavoritesCoordinator
}
