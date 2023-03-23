//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 30/11/22.
//

import Common
import Foundation

public protocol CharacterRepository {
    
    func getCharater(offset: Int, completion: @escaping ResultCompletion<DataCharacter>)
}
