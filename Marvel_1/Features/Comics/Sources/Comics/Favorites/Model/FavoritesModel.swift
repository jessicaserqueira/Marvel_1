//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 06/04/23.
//

import Domain
import Foundation

public struct FavoritesModel: Identifiable, Codable {
    
    public var item: Item
    
    public init(_ item: Item)  {
        self.item = item
        
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
        item.result_description
    }
    
    var thumbnail: URL {
        let path = item.thumbnail.path
        let ext = item.thumbnail.extensionType
        let urlString = "\(path).\(ext)"
        return URL(string: urlString) ?? URL(fileURLWithPath: "")
        
    }
    
    var toDomain: Domain.Item {
        item
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
