//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 24/03/23.
//

import Foundation

public struct ThumbnailFirebase: Codable {
    public let path: String
    public let extensionType: String
    
    public init(path: String, extensionType: String) {
        self.path = path
        self.extensionType = extensionType
    }
}
