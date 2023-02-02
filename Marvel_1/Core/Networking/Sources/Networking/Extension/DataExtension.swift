//
//  DataExtension.swift
//  Marvel
//
//  Created by Jessica Serqueira on 30/11/22.
//

import Foundation

extension Data {
    
    func convertToJson<T: Decodable>(type: T.Type) -> T? {
        do {
            let result = try JSONDecoder().decode(ResultModel<T>.self, from: self)
            return result.data
        } catch {
            debugPrint(error)
        }
        return nil
    }
}
