//
//  MarvelService.swift
//  Marvel
//
//  Created by Jessica Serqueira on 30/11/22.
//

import Foundation
import UIKit

public enum MarvelService {
    
    static let baseUrlString = "https://gateway.marvel.com:443/"
    static let apiVersion = "v1/"
    static let privateKey = "d7f2879d24bc1b99339bdc91f0c0d51e5cf6a8bf"
    static let publicKey = "5f57f1e2e1e9d30841921274a5910396"
    
    case characters(offset: Int)
    case charactersDetails(id: Int)
    
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
        case .characters: return .get
        case .charactersDetails: return .get
        }
    }

    public var path: String {
        switch self {
        case .characters:
            return "public/characters?"
        case .charactersDetails(let id):
            return "public/characters/\(id)?"
        }
    }
    
    public var parameters: String {
        
        switch self {
        case .characters(let offset):
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
        case .characters:
            return urlRequest
        case .charactersDetails:
            return urlRequest
        }
    }
}
