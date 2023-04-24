//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 09/02/23.
//

import Foundation
import Domain

public struct ComicsResponseDTO: Codable  {
    
    public let id: Int
    public let digitalId: Int
    public let title: String
    public let issueNumber: Int
    public let variantDescription: String
    public let description: String?
    public let modified: String
    public let isbn: String
    public let upc: String
    public let diamondCode: String
    public let ean: String
    public let issn: String
    public let format: String
    public let pageCount: Int
    public let textObjectsComics: [TextObjectComicsDTO]
    public let thumbnailComics: ThumbnailComicsDTO?
    
    public init(
        id: Int,
        digitalId: Int,
        title: String,
        issueNumber: Int,
        variantDescription: String,
        description: String?,
        modified: String,
        isbn: String,
        upc: String,
        diamondCode: String,
        ean: String,
        issn: String,
        format: String,
        pageCount: Int,
        textObjectsComics: [TextObjectComicsDTO],
        thumbnailComics: ThumbnailComicsDTO?
        
    ) {
        
        self.id = id
        self.digitalId = digitalId
        self.title = title
        self.issueNumber = issueNumber
        self.variantDescription = variantDescription
        self.description = description
        self.modified = modified
        self.isbn = isbn
        self.upc = upc
        self.diamondCode = diamondCode
        self.ean = ean
        self.issn = issn
        self.format = format
        self.pageCount = pageCount
        self.textObjectsComics = textObjectsComics
        self.thumbnailComics = thumbnailComics
    }
}

extension ComicsResponseDTO {
    
    enum CodingKeys: String, CodingKey {
        case id
        case digitalId
        case title
        case issueNumber
        case variantDescription
        case description
        case modified
        case isbn
        case upc
        case diamondCode
        case ean
        case issn
        case format
        case pageCount
        case textObjectsComics = "textObjects"
        case thumbnailComics = "thumbnail"
        
    }
}

extension ComicsResponseDTO {
    public var toDomain: ComicsResponse {
        .init(
            id: id,
            digitalId: digitalId,
            title: title,
            issueNumber: issueNumber,
            variantDescription: variantDescription,
            description: description,
            modified: modified,
            isbn: isbn,
            upc: upc,
            diamondCode: diamondCode,
            ean: ean,
            issn: issn,
            format: format,
            pageCount: pageCount,
            textObjectsComics: textObjectsComics.map { $0.toDomain },
            thumbnailComics: thumbnailComics?.toDomain
        )
    }
}
