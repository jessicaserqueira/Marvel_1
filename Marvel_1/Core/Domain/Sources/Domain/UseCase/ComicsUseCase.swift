//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 09/02/23.
//

import Common
import Foundation

public class ComicsUseCase {
    
    private let comicsRepository: ComicsRepository
    
    public init(comicsRepository: ComicsRepository) {
        self.comicsRepository = comicsRepository
    }
}

extension ComicsUseCase: ComicsUseCaseProtocol {
    public func getComics(offset: Int, completion: @escaping Common.ResultCompletion<DataComics>) {
        
        comicsRepository.getComics(offset: offset, completion: completion)
    }
}
