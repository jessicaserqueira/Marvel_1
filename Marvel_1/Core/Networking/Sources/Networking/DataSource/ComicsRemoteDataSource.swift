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

    public init() {}
}

extension ComicsRemoteDataSource: AppData.ComicsRemoteDataSource {
    public func requestComics(offset: Int, completion: @escaping Common.ResultCompletion<AppData.DataCharacterDTO>) {
        
    }
}
