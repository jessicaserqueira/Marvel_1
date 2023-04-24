//
//  File.swift
//  
//
//  Created by NMAS Amaral on 04/01/23.
//

import Foundation

@MainActor
public protocol DetailsCharacterModelling: ObservableObject {
    var data: [CharacterModel] { get }
    
    func fetchCharacterDetails(with id: Int)
}
