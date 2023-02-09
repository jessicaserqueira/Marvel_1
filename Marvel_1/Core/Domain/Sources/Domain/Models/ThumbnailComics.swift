//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 09/02/23.
//

public struct ThumbnailComics: Codable {
    public let path: String
    public let ext: String
    
    public init(path: String, ext: String) {
        self.path = path
        self.ext = ext
    }
}
