//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 23/01/23.
//

import Foundation

public protocol FetchImageRepository: AnyObject {
    func request(_ url: URL) async throws -> Data
    
}
