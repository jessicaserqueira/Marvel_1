//
//  File.swift
//  
//
//  Created by NMAS Amaral on 20/12/22.
//

import Common
import Domain

public protocol ComicsRemoteDataSource: AnyObject {
    func requestComics(offset: Int, completion: @escaping ResultCompletion<DataComicsDTO>)
}
