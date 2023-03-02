//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 24/02/23.
//

import Common
import Domain
import Foundation

public struct DetailsCharaterRepository {
    
    private let remote: DetailsCharacterRemoteDataSource
    
    public init(remote: DetailsCharacterRemoteDataSource) {
        self.remote = remote
    }
}

extension DetailsCharaterRepository: Domain.DetailsCharacterRepository {
    public func getDetailsCharater(with id: Int, completion: @escaping Common.ResultCompletion<Domain.DataCharacter>) {

        remote.request(with: id) { result  in
            switch result {
            case .success(let response):
                completion(.success(response.toDomain))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
