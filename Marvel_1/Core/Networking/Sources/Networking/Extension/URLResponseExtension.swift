//
//  URLResponseExtension.swift
//  Marvel
//
//  Created by Jessica Serqueira on 30/11/22.
//

import Foundation

extension URLResponse {
    
    var getStatusCode: Int? {
        guard let httpResponse = self as? HTTPURLResponse else { return nil }
        return httpResponse.statusCode
    }
}
