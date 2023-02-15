//
//  File.swift
//  
//
//  Created by NMAS Amaral on 15/12/22.
//

import SwiftUI

@MainActor
public protocol CharacterHomeModelling: ObservableObject {
    
    var data: [CharacterModel] { get }
    var isLoading: Bool { get }
    
    func didAppear()
    func fetchCharacter()
    func filterCharacters(searchTerm: String) -> [CharacterModel]
    func favoriteButton()
    func previousScreen()
    func buttonDetails()
}
