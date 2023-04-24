//
//  File 2.swift
//  
//
//  Created by Jessica Serqueira on 06/03/23.
//

import Common
import Foundation

public class DetailsComicsUseCase {
    
    private let detailsComicsRepository: DetailsComicsRepository
    
    public init(detailsComicsRepository: DetailsComicsRepository) {
        self.detailsComicsRepository = detailsComicsRepository
    }
}

extension DetailsComicsUseCase: DetailsComicsUseCaseProtocol {
    public func getDetailsComics(with id: Int, completion: @escaping Common.ResultCompletion<DataComics>) {
        detailsComicsRepository.getDetailsComics(with: id, completion: completion)
    }
}
