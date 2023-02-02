//
//  File.swift
//  
//
//  Created by NMAS Amaral on 20/12/22.
//

import Common
import Domain
import Foundation
import SwiftUI

public class ComicsRepository {

    private let local: ComicsLocalDataSource
    private let remote: ComicsRemoteDataSource

    public init(local: ComicsLocalDataSource, remote: ComicsRemoteDataSource) {
        self.local = local
        self.remote = remote
    }
}

extension ComicsRepository: Domain.CharacterRepository {
    public func getCharater(offset: Int, completion: @escaping Common.ResultCompletion<Domain.CharacterData>) {

    }
}
