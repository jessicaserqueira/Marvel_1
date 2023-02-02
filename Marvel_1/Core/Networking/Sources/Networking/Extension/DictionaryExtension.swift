//
//  DictionaryExtension.swift
//  Marvel
//
//  Created by Jessica Serqueira on 30/11/22.
//

import Foundation


extension Dictionary {
    
    var queryString: String? {
        return self.reduce("") { "\($0!)\($1.0)=\($1.1)&" }
    }
}
