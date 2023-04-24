//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 30/11/22.
//

import AppData
import Common

public class CharacterRemoteDataSource {
    
    let serviceManager: ServiceManager
    
    public init(serviceManager: ServiceManager) {
        self.serviceManager = serviceManager
    }
}

extension CharacterRemoteDataSource: AppData.CharacterRemoteDataSource {
    public func request(offset: Int, completion: @escaping Common.ResultCompletion<AppData.DataCharacterDTO>) {
        
        serviceManager.request(type: DataCharacterDTO.self, router: .characters(offset: offset)) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
