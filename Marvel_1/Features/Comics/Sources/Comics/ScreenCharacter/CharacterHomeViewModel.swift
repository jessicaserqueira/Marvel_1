//
//  File.swift
//
//
//  Created by NMAS Amaral on 15/12/22.
//

import SwiftUI
import Common
import Domain

public class CharacterHomeViewModel: ObservableObject {
    
    @Published public var data: [CharacterModel] = []
    @Published var searchTerm: String = ""
    @Published public var isLoading: Bool = false
    
    private var offset: Int = 0
    private var totalPages: Int = 0
    
    private var coordinator: CharacterHomeCoordinating?
    private lazy var characterUseCase = DIContainer.shared.resolveSafe(Domain.CharacterUseCaseProtocol.self)
    
    public init(coordinator: CharacterHomeCoordinating) {
        self.characterUseCase = characterUseCase
        self.coordinator = coordinator
    }
}

//MARK: - ScreenHomeModelling
extension CharacterHomeViewModel: CharacterHomeModelling {

    public func didAppear() {
        fetchCharacter()
    }
    
    public func fetchCharacter() {
        isLoading = true
        characterUseCase.getCharater(offset: offset) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.totalPages = (response.total ?? 0) / 20
                self.data +=  response.results?.compactMap { CharacterModel($0) } ?? []
                self.offset += 20
                if self.offset < response.total ?? 0 {
                    self.fetchCharacter()
                } else {
                    self.isLoading = false
                }
            case .failure(let error):
                print(error.localizedDescription)
                self.isLoading = false
            }
        }
    }
    
    public func filterCharacters(searchTerm: String) -> [CharacterModel] {
 
        if searchTerm.isEmpty {
            return data
        }
        return data.filter {
            $0.name.lowercased().contains(searchTerm.lowercased())
        }
    }
    
    public func nextScreen() {
        print("Próxima tela")
    }
    
    public func previousScreen() {
        print("Tela anterior")
    }
}
