//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 22/02/23.
//
import Common
import Domain
import Foundation

public class DetailsCharacterViewModel: ObservableObject {
    
    @Published public var data: [CharacterModel] = []
    
    private var coordinator: DetailsCharacterCoordinating?
    private lazy var detailsCharacterUseCase = DIContainer.shared.resolveSafe(Domain.DetailsCharacterUseCaseProtocol.self)
    
    public init(coordinator: DetailsCharacterCoordinating) {
        self.coordinator = coordinator
        self.detailsCharacterUseCase = detailsCharacterUseCase
    }
}

//MARK: - ScreenHomeModelling
extension DetailsCharacterViewModel: DetailsCharacterModelling {
    public func fetchCharacterDetails(with id: Int) {
        
        detailsCharacterUseCase.getDetailsCharater(with: id) { result in
            switch result {
            case .success(let character):
                if let result = character.results {
                    DispatchQueue.main.async {
                        self.data = result.map { CharacterModel($0) }
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
