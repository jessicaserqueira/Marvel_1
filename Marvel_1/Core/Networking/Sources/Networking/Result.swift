//
//  Result.swift
//  Marvel
//
//  Created by Jessica Serqueira on 30/11/22.
//


import Foundation

typealias NetworkCompletion<T: Decodable> = (_ result: Results<T>)-> Void

enum Results<T> {
    case success(data: T)
    case failure(error: ErrorType)
}
