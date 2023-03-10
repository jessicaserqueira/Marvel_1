//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 13/12/22.
//

import Foundation

public typealias ResultCompletion<T> = (_ result: Result<T, Error>) -> Void

public extension Result {
    
    /// Returns the value if self represents a success, `nil` otherwise.
    var success: Success? {
        switch self {
        case let .success(value):
            return value
        case .failure:
            return nil
        }
    }
    
    /// Returns the error if self represents a failure, `nil` otherwise.
    var failure: Failure? {
        switch self {
        case .success:
            return nil
        case let .failure(error):
            return error
        }
    }
}
