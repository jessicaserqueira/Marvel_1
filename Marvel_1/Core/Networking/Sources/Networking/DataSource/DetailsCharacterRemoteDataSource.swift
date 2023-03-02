//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 24/02/23.
//

import AppData
import Common

public class DetailsCharacterRemoteDataSource {
    
    let serviceManager: ServiceManager
    
    public init(serviceManager: ServiceManager) {
        self.serviceManager = serviceManager
    }
}

extension DetailsCharacterRemoteDataSource: AppData.DetailsCharacterRemoteDataSource {
    public func request(with id: Int, completion: @escaping Common.ResultCompletion<AppData.DataCharacterDTO>) {
        
        serviceManager.request(type: DataCharacterDTO.self, router: .charactersDetails(id: id)) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
