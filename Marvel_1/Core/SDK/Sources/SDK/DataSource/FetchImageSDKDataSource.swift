//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 20/01/23.
//

import Kingfisher
import SwiftUI
import Foundation
import AppData

public struct FetchImageSDKDataSource {
    
    public init() {
       
    }
}

extension FetchImageSDKDataSource: AppData.FetchImageDataSource {
    public func request(_ url: URL) async throws -> Data {
        try await withCheckedThrowingContinuation { continuation in
            KingfisherManager.shared.retrieveImage(with: url) {
                switch $0 {
                case .failure(let error):
                    continuation.resume(with: .failure(error))
                case .success(let data):
                    continuation.resume(with: .success(data.image.pngData() ?? Data()))
                }
            }
        }
    }
}
