//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 16/01/23.
//

import Foundation

public struct Page<T: Decodable>: Decodable {
    public var offset: Int?
    public var limit: Int?
    public var total: Int?
    public var results: [T]?
}
