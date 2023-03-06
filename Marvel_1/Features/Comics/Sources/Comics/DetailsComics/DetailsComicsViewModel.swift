//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 23/02/23.
//

import Common
import Domain
import SwiftUI

public class DetailsComicsViewModel: ObservableObject {
    
    @Published public var data: [ComicsModel] = []
    
    private var coordinator: DetailsComicsCoordinating?
    private lazy var detailsComicsUseCase = DIContainer.shared.resolveSafe(Domain.DetailsComicsUseCaseProtocol.self)
    
    public init(coordinator: DetailsComicsCoordinating) {
        self.coordinator = coordinator
        self.detailsComicsUseCase = detailsComicsUseCase
    }
}


//MARK: - ScreenHomeModelling
extension DetailsComicsViewModel: DetailsComicsModelling {
    public func fetchComicsDetails(with id: Int) {
        
        detailsComicsUseCase.getDetailsComics(with: id) { result in
            switch result {
            case .success(let character):
                if let result = character.results {
                    DispatchQueue.main.async {
                        self.data = result.map { ComicsModel($0) }
                    }
                } else {
                    DispatchQueue.main.async {
                        self.data = []
                    }
                }
            case .failure(let error):
                // Handle error here
                print("Error while loading character: \(error.localizedDescription)")
            }
        }
    }
}
