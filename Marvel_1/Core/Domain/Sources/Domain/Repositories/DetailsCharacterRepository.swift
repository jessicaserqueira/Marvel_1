//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 24/02/23.
//

import Common
import Foundation

public protocol DetailsCharacterRepository {
    
    func getDetailsCharater(with id: Int, completion: @escaping ResultCompletion<DataCharacter>)
    
}
