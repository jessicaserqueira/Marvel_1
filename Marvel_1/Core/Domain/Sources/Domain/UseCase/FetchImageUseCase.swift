//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 23/01/23.
//

import Foundation

public class FetchImageUseCase {
    
    private let fetchImageRepository: FetchImageRepository
    
    public init(fetchImageRepository: FetchImageRepository) {
        self.fetchImageRepository = fetchImageRepository
    }
}

extension FetchImageUseCase: FetchImageUseCaseProtocol {
    public func fetch(_ url: URL) async throws -> Data {
        try await fetchImageRepository.request(url)
    }
}
