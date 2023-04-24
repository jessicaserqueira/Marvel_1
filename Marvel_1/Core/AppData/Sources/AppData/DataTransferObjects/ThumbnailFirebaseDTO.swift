//
//  File 2.swift
//  
//
//  Created by Jessica Serqueira on 24/03/23.
//

import Domain
import Foundation

public struct ThumbnailFirebaseDTO: Codable {
    
    public let path: String
    public let extensionType: String
    
    public init(
        path: String,
        extensionType: String
    ) {
        self.path = path
        self.extensionType = extensionType
    }
}

extension ThumbnailFirebaseDTO {
    
   public enum CodingKeys: String, CodingKey {
        case path
        case extensionType = "extension"
    }
}

extension ThumbnailFirebaseDTO {
  public func toThumbnailFirebase() -> ThumbnailFirebase {
        return ThumbnailFirebase(path: self.path, extensionType: self.extensionType)
    }
}
