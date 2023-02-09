//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 08/02/23.
//
import Common
import Foundation

public protocol ComicsRepository {
    
    func getHQ(offset: Int, completion: @escaping ResultCompletion<Data>)
    
}
