//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 08/02/23.
//
import Common
import Foundation

public protocol ComicsRepository {
    
    func getComics(offset: Int, completion: @escaping ResultCompletion<DataComics>)
    
}
