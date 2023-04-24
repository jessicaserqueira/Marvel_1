//
//  MarvelService.swift
//  Marvel
//
//  Created by Jessica Serqueira on 30/11/22.
//

import Foundation
import UIKit

public enum MarvelService {
    
    static let baseUrlString = "https://gateway.marvel.com/"
    static let apiVersion = "v1/"
    static let privateKey = "b6e847fd18120736057cbba8037ceb7ab0f76278"
    static let publicKey = "9e8af919d77f61ed11f75668aaa6d222"
    
    case characters(offset: Int)
    case charactersDetails(id: Int)
    case comics(Offset: Int)
    case comicsDetails(id: Int)
    
    public enum HTTPMethod {
        case get
        case post
        case put
        case delete
        
        public var value: String {
            switch self {
            case .get: return "GET"
            case .post: return "POST"
            case .put: return "PUT"
            case .delete: return "DELETE"
            }
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .characters, .charactersDetails, .comics, .comicsDetails:
            return .get
        }
    }

    public var path: String {
        switch self {
        case .characters:
            return "public/characters?"
        case .charactersDetails(let id):
            return "public/characters/\(id)?"
        case .comics:
            return "public/comics?"
        case .comicsDetails(let id):
            return "public/comics/\(id)?"
        }
    }
    
    public var parameters: String {
        
        switch self {
        case .characters(let offset), .comics(let offset):
            return ["offset": offset].queryString.unwrappedValue
        default:
            return [:].queryString.unwrappedValue
        }
    }
    
    public var credentials: String {
        
        let ts = Date().timeIntervalSince1970.description
        let hash = "\(ts)\(MarvelService.privateKey)\(MarvelService.publicKey)".md5
        let authParams = ["ts": ts, "apikey": MarvelService.publicKey, "hash": hash]
        return authParams.queryString.unwrappedValue
    }
    
    public func asURLRequest() throws -> URLRequest {
        
        let urlString = "\(MarvelService.baseUrlString)\(MarvelService.apiVersion)\(path)\(credentials)\(parameters)"
        
        guard let url = URL(string: urlString) else { throw ErrorType.parseUrlFail }
        
        var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 10)
        urlRequest.httpMethod = method.value
        
        switch self {
        case .characters, .comics:
            return urlRequest
        case .charactersDetails, .comicsDetails:
            return urlRequest
        }
    }
}
