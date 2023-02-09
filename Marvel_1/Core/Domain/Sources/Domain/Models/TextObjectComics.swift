//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 09/02/23.
//

import Foundation

public struct TextObjectComics: Codable {
    
    public let type: String
    public let language: String
    public let text: String
    
    public init(
        type: String,
        language: String,
        text: String
    ) {
        self.type = type
        self.language = language
        self.text = text
    }
    
    var fullDescription: String {
            return "\(type) - \(language) - \(text)"
        }
}
