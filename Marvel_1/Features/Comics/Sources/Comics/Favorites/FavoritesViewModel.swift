//
//  File.swift
//  
//
//  Created by NMAS Amaral on 09/01/23.
//

import Domain
import Common
import Foundation

public class FavoritesViewModel: ObservableObject {
    
    private var coordinator: FavoritesCoordinating?
    
    public init(coordinator: FavoritesCoordinating) {
        self.coordinator = coordinator
    }
    //MARK: - Properties
    #warning("TODO")
}
