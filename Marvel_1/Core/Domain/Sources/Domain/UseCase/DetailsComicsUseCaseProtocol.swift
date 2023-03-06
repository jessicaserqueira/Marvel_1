//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 06/03/23.
//

import Common
import Foundation

public protocol DetailsComicsUseCaseProtocol {
    func getDetailsComics(with id: Int, completion: @escaping Common.ResultCompletion<DataComics>)
}
