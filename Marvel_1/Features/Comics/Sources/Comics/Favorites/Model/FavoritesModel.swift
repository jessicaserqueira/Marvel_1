//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 06/04/23.
//

import Domain
import Foundation

public struct FavoritesModel: Identifiable {
    
    public var item: Character
    public let isFavorite: Bool
    
    public init(_ item: Character, isFavorite: Bool)  {
        self.item = item
        self.isFavorite = isFavorite
        
    }
}

extension FavoritesModel {
    
    public var id: Int {
        item.id
    }
    
    var name: String {
        item.name
    }
    
    var resultDescription: String {
        item.resultDescription
    }
    
    var thumbnail: URL {
        let path = item.thumbnailFirebase.path
        let ext = item.thumbnailFirebase.extensionType
        let urlString = "\(path).\(ext)"
        return URL(string: urlString) ?? URL(fileURLWithPath: "")
        
    }
}

extension FavoritesModel {
    
    var toDictionary: [String: Any] {
        let dict: [String: Any?] = [
            "id": id,
            "name": name,
            "resultDescription": resultDescription,
            "thumbnail": thumbnail.absoluteString
            
            
        ]
        return dict.compactMapValues { $0 }
    }
}

