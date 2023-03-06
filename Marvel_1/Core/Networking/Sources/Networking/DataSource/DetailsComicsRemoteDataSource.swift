//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 06/03/23.
//

import AppData
import Common

public class DetailsComicsRemoteDataSource {
    
    let serviceManager: ServiceManager
    
    public init(serviceManager: ServiceManager) {
        self.serviceManager = serviceManager
    }
}

extension DetailsComicsRemoteDataSource: AppData.DetailsComicsRemoteDataSource {
    public func request(with id: Int, completion: @escaping Common.ResultCompletion<AppData.DataComicsDTO>) {
        
        serviceManager.request(type: DataComicsDTO.self, router: .comicsDetails(id: id)) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
