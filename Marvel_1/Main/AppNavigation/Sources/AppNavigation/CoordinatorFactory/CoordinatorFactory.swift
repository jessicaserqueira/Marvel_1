//
//  File.swift
//  
//
//  Created by NMAS Amaral on 22/12/22.
//

import Common
import Foundation
import Comics

public protocol CoordinatorFactory: DependencyFactory {
    func makeSplashCoordinator() -> SplashScreenCoordinator
    func makeLoginCoordinator() -> LoginCoordinator
    func makeCreateAccountCoordinator() -> CreateAccountCoordinator
    func makeTabBarCoordinator() -> TabBarCoordinator
    func makeScreenDetailsCoordinator() -> DetailsCharacterCoordinator
    func makeCharacterCoordinator() -> CharacterHomeCoordinator
}
