//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 09/02/23.
//

import Foundation

public struct ComicsResponse: Codable  {
    
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
    public let textObjectsComics: [TextObjectComics]?
    public let thumbnailComics: ThumbnailComics?
    
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
        textObjectsComics: [TextObjectComics]?,
        thumbnailComics: ThumbnailComics?
        
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
