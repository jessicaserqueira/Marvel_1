//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 13/12/22.
//

import Foundation

struct ResultModel<T: Decodable>: Decodable {
    var code: Int?
    var codeString: String?
    var status: String?
    var message: String?
    var data: T?
    
    enum CodingKeys: CodingKey {
        case code
        case codeString
        case status
        case message
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<ResultModel<T>.CodingKeys> = try decoder.container(keyedBy: ResultModel<T>.CodingKeys.self)
        
        if let code = try? container.decodeIfPresent(String.self, forKey: ResultModel<T>.CodingKeys.code) {
            self.codeString = code
        } else {
            self.code = try container.decodeIfPresent(Int.self, forKey: ResultModel<T>.CodingKeys.code)
        }
        
        self.status = try container.decodeIfPresent(String.self, forKey: ResultModel<T>.CodingKeys.status)
        self.message = try container.decodeIfPresent(String.self, forKey: ResultModel<T>.CodingKeys.message)
        self.data = try container.decodeIfPresent(T.self, forKey: ResultModel<T>.CodingKeys.data)
    }
}
