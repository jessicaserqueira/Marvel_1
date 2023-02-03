//
//  File.swift
//  
//
//  Created by NMAS Amaral on 23/12/22.
//
import Comics
import Common
import SwiftUI

class CharacterFactoryImplementation: CharacterViewControllersFactory {
    
    private let container: DIContainer
    
    required init(container: DIContainer) {
        self.container = container
    }
    
    func makeCharacterViewController() -> Comics.CharacterHomeView {
                
        guard let viewModel = container.resolveSafe(CharacterHomeModelling.self) as? CharacterHomeViewModel else {
            preconditionFailure("CharacterHomeViewModelling is nil")
        }
        
        let viewController = CharacterHomeView(viewModel: viewModel)
        return viewController
    }
}
