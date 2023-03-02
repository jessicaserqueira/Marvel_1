//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 24/02/23.
//

import Common
import Foundation

public protocol DetailsCharacterRemoteDataSource: AnyObject {
    func request(with id: Int, completion: @escaping ResultCompletion<DataCharacterDTO>)

}
