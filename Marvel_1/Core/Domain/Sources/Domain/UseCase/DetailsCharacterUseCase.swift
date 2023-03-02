//
//  File 2.swift
//  
//
//  Created by Jessica Serqueira on 24/02/23.
//

import Common
import Foundation

public class DetailsCharacterUseCase {
    
    private let detailsCharacterRepository: DetailsCharacterRepository
    
    public init(detailsCharacterRepository: DetailsCharacterRepository) {
        self.detailsCharacterRepository = detailsCharacterRepository
    }
}

extension DetailsCharacterUseCase: DetailsCharacterUseCaseProtocol {
    public func getDetailsCharater(with id: Int, completion: @escaping Common.ResultCompletion<DataCharacter>) {
        detailsCharacterRepository.getDetailsCharater(with: id, completion: completion)
    }
}

