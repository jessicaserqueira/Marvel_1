//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 24/03/23.
//

import Foundation

public struct Item: Codable {
    

    public let id: Int
    public let name: String
    public let result_description: String
    public let thumbnail: ThumbnailFirebase
    
    
    public init(
        id: Int,
        name: String,
        result_description: String,
        thumbnail: ThumbnailFirebase
    ) {

        self.id = id
        self.name = name
        self.result_description = result_description
        self.thumbnail = thumbnail
    }
}
