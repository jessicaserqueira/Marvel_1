//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 06/03/23.
//

import Common
import Domain
import Foundation

public struct DetailsComicsRepository {
    
    private let remote: DetailsComicsRemoteDataSource
    
    public init(remote: DetailsComicsRemoteDataSource) {
        self.remote = remote
    }
}

extension DetailsComicsRepository: Domain.DetailsComicsRepository {
    public func getDetailsComics(with id: Int, completion: @escaping Common.ResultCompletion<Domain.DataComics>) {

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
