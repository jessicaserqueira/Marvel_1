//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 30/11/22.
//

import Common
import Domain
import Foundation

public struct CharaterRepository {
    
    private let remote: CharacterRemoteDataSource
    
    public init(remote: CharacterRemoteDataSource) {
        self.remote = remote
    }
}

extension CharaterRepository: Domain.CharacterRepository {

    
    public func getCharater(offset: Int, completion: @escaping Common.ResultCompletion<Domain.DataCharacter>) {
        
        remote.request(offset: offset) { result  in
            switch result {
            case .success(let response):
                completion(.success(response.toDomain))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
