//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 30/11/22.
//

import Common
import Foundation

public protocol CharacterRemoteDataSource: AnyObject {
    func request(offset: Int, completion: @escaping ResultCompletion<DataCharacterDTO>)
}
