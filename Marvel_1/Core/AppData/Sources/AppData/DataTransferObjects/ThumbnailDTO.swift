//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 01/12/22.
//

import Foundation
import Domain

public struct ThumbnailDTO: Codable {
    
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

extension ThumbnailDTO {
    
    public var toDomain: Thumbnail {
        .init(
            path: path,
            ext: ext
        )
    }
}
