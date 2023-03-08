//
//  File.swift
//
//
//  Created by Jessica Serqueira on 17/01/23.
//

import Domain
import Foundation
import SwiftUI

public struct CharacterModel: Identifiable, Decodable {
    
    public let item: CharacterResponse

    
    init(_ item: CharacterResponse) {
        self.item = item

    }
}

extension CharacterModel {
    
    public var id: Int? {
        item.id
    }
    
    var name: String {
        item.name
    }
    
    var resultDescription: String {
        item.resultDescription
    }
    
    var thumbnail: URL {
        guard let path = item.thumbnail?.path, let ext = item.thumbnail?.ext else { return URL(fileURLWithPath: "") }
        let urlString = "\(path).\(ext)"
        return URL(string: urlString) ?? URL(fileURLWithPath: "")
    }
    
    var toDomain: CharacterResponse {
        item
    }
}

