//
//  File.swift
//
//  Created by NMAS Amaral on 09/01/23.
//

import Domain
import Foundation
import Common
import SwiftUI

public class ComicsViewModel: ObservableObject {
    
    @Published public var data: [ComicsModel] = []
    @Published public var searchTerm: String = ""
    @Published public var isLoading: Bool = false
    @Published public var offset: Int = 0
    @Published public var totalPages: Int = 0
    
    private var coordinator: ComicsCoordinating?
    private lazy var comicsUseCase = DIContainer.shared.resolveSafe(Domain.ComicsUseCaseProtocol.self)
    
    public init(coordinator: ComicsCoordinating) {
        self.comicsUseCase = comicsUseCase
        self.coordinator = coordinator
    }
}

//MARK: - HQModelling
extension ComicsViewModel: ComicsModelling {
    
    public func didAppear() {
        fetchComics()
    }
    
    public func fetchComics() {
        isLoading = true
        comicsUseCase.getComics(offset: offset) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.totalPages = (response.total ?? 0) / 20
                self.data += response.results?.compactMap { ComicsModel($0) } ?? []
                self.offset += 20
                self.isLoading = false
            case .failure(let error):
                print(error.localizedDescription)
                self.isLoading = false
            }
        }
    }
    
    public func buttonDetails(with id: Int) {
        coordinator?.buttonDetails(with: id)
    }
}
