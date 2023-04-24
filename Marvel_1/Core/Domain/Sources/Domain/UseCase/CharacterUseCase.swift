//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 23/01/23.
//

import Common
import Foundation

public class CharacterUseCase {
    
    private let characterRepository: CharacterRepository
    
    public init(characterRepository: CharacterRepository) {
        self.characterRepository = characterRepository
    
    }
}

extension CharacterUseCase: CharacterUseCaseProtocol {    
    public func getCharater(offset: Int, completion: @escaping Common.ResultCompletion<DataCharacter>) {
        characterRepository.getCharater(offset: offset, completion: completion)
    }
}
