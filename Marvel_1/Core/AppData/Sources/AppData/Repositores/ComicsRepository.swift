//
//  File.swift
//  
//
//  Created by NMAS Amaral on 20/12/22.
//

import Common
import Domain
import Foundation
import SwiftUI

public class ComicsRepository {
    
    private let remote: ComicsRemoteDataSource
    
    public init(remote: ComicsRemoteDataSource) {
        self.remote = remote
    }
}

extension ComicsRepository: Domain.ComicsRepository {
    public func getComics(offset: Int, completion: @escaping Common.ResultCompletion<Domain.DataComics>) {
        remote.requestComics(offset: offset) {result  in
            switch result {
            case .success(let response):
                completion(.success(response.toDomain))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
