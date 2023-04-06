//
//  File.swift
//
//  Created by Jessica Serqueira on 09/02/23.
//

import Domain
import Foundation
import SwiftUI


public struct ComicsModel: Identifiable, Codable {
    private let item: ComicsResponse
    
    init(_ item: ComicsResponse) {
        self.item = item
    }
}

extension ComicsModel {
    
    public var id: Int? {
        item.id
    }
    
    var title: String {
        item.title
    }
    
    var thumbnail: URL {
        guard let path = item.thumbnailComics?.path, let ext = item.thumbnailComics?.ext else { return URL(fileURLWithPath: "") }
        let urlString = "\(path).\(ext)"
        return URL(string: urlString) ?? URL(fileURLWithPath: "")
    }
    
    var textObjects: [String] {
        let texts = item.textObjectsComics ?? []
        return texts.map { $0.text }
    }
    
    var toDomain: ComicsResponse {
        item
    }
}
