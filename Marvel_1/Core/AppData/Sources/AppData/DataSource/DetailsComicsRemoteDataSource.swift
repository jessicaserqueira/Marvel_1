//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 06/03/23.
//

import Common
import Foundation

public protocol DetailsComicsRemoteDataSource: AnyObject {
    func request(with id: Int, completion: @escaping ResultCompletion<DataComicsDTO>)
}
