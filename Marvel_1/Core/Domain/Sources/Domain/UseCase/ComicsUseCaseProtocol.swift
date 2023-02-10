//
//  File.swift
//  
//
//  Created by NMAS Amaral on 20/12/22.
//


import Foundation
import Common

public protocol ComicsUseCaseProtocol {
    func getComics(offset: Int, completion: @escaping Common.ResultCompletion<DataComics>)
}
