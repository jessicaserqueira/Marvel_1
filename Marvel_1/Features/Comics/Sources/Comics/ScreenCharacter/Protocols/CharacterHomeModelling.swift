//
//  File.swift
//  
//
//  Created by NMAS Amaral on 15/12/22.
//

import SwiftUI

public protocol CharacterHomeModelling: AnyObject {
    
    var data: [CharacterModel] { get }

    func didAppear()
    func fetchCharacter()
    func nextScreen()
    func previousScreen()
}
