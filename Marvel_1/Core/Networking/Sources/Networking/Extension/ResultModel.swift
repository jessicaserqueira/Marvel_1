//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 13/12/22.
//

import Foundation

struct ResultModel<T: Decodable>: Decodable {
    var code: Int?
    var status: String?
    var data: T?
}
