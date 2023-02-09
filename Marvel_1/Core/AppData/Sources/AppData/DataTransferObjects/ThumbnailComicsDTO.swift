//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 09/02/23.
//

import Foundation
import Domain

public struct ThumbnailComicsDTO: Codable {
    public let path: String
    public let ext: String
    
    public init(path: String, ext: String) {
        self.path = path
        self.ext = ext
    }
}

extension ThumbnailComicsDTO {
    
    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
}

extension ThumbnailComicsDTO {
    
    public var toDomain: ThumbnailComics {
        .init(
            path: path,
            ext: ext
        )
    }
}
