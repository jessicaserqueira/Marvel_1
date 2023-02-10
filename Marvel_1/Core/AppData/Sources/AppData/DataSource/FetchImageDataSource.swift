//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 23/01/23.
//

import Common
import Foundation

public protocol FetchImageDataSource {
    func request(_ url: URL) async throws -> Data
    
}
