//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 10/11/22.
//

import Foundation

public struct Thumbnail: Codable  {
    
    public let path: String
    public let ext: String
    
    public init(
        path: String,
        ext: String
    ) {
        self.path = path
        self.ext = ext
    }
    private enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
}
