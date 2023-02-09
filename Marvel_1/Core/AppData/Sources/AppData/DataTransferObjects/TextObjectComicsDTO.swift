//
//  File 2.swift
//  
//
//  Created by Jessica Serqueira on 09/02/23.
//

import Foundation
import Domain

public struct TextObjectComicsDTO: Codable {
    
    public let type: String
    public let language: String
    public let text: String

    public init(type: String, language: String, text: String) {
        self.type = type
        self.language = language
        self.text = text
    }
}

extension TextObjectComicsDTO {
    public var toDomain: TextObjectComics {
        .init(
            type: type,
            language: language,
            text: text
        )
    }
}
