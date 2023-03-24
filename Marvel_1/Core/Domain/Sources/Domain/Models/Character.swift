//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 24/03/23.
//

import Foundation

public struct Character: Codable {
    public let id: Int
    public let name: String
    public let resultDescription: String
    public let thumbnailFirebase: ThumbnailFirebase
        
    public init(
        id: Int,
        name: String,
        resultDescription: String,
        thumbnailFirebase: ThumbnailFirebase
    ) {
            self.id = id
            self.name = name
            self.resultDescription = resultDescription
            self.thumbnailFirebase = thumbnailFirebase
        }
}
