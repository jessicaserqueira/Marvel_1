//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 01/12/22.
//

import Foundation
import Domain

public struct URLElementDTO: Codable {
    
    public let type: URLTypeDTO
    public let url: String
    
    public init(
        type: URLTypeDTO,
        url: String
    ) {
        self.type = type
        self.url = url
    }
}

public extension URLElementDTO {
    
    enum URLTypeDTO: String, Codable {
        case comiclink
        case detail
        case wiki
    }
}

extension URLElementDTO.URLTypeDTO {
    
    var asDomainURLType: URLElement.URLType {
        URLElement.URLType (type: self.rawValue)
        
    }
}

public extension URLElementDTO {
    
    var toDomain: URLElement {
       .init(
        type: type.asDomainURLType,
        url: url
       )
    }
}
