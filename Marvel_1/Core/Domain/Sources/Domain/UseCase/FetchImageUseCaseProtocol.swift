//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 23/01/23.
//

import Foundation

public protocol FetchImageUseCaseProtocol {
    func fetch(_ url: URL) async throws -> Data

}
