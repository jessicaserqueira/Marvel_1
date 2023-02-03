//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 02/02/23.
//

import Common

public protocol CharacterViewControllersFactory: DependencyFactory {
    
    func makeCharacterViewController() -> CharacterHomeView
}
