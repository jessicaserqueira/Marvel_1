//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 10/11/22.
//

import Foundation

public struct URLElement: Codable  {
    
    public let type: URLType
    public let url: String
    
    public init(
        type: URLType,
        url: String
    ) {
        self.type = type
        self.url = url
    }
}

extension URLElement {
    
    public enum URLType: String, Codable {
        case comiclink
        case detail
        case wiki
        case none
        
        public init(type: String) {
            self = URLType(rawValue: type) ?? .none
        }
    }
}
