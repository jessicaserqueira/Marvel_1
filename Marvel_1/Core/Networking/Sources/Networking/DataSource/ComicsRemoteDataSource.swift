//
//  File.swift
//  
//
//  Created by NMAS Amaral on 19/12/22.
//

import Common
import Domain
import AppData

public class ComicsRemoteDataSource {
    
    let serviceManager: ServiceManager
    
    public init(serviceManager: ServiceManager) {
        self.serviceManager = serviceManager
    }
}

extension ComicsRemoteDataSource: AppData.ComicsRemoteDataSource {
    public func requestComics(offset: Int, completion: @escaping Common.ResultCompletion<AppData.DataComicsDTO>) {
        
        serviceManager.request(type: DataComicsDTO.self, router: .comics(Offset: offset)) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
