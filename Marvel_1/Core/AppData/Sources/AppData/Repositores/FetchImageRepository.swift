//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 23/01/23.
//

import Domain
import Foundation

public class FetchImageRepository {
    
    private let remote: FetchImageDataSource
    
    public init(remote: FetchImageDataSource) {
        self.remote = remote
    }
}

extension FetchImageRepository:  Domain.FetchImageRepository {
    public func request(_ url: URL) async throws -> Data {
        try await remote.request(url)
    }
}
