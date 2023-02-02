//
//  File.swift
//
//
//  Created by NMAS Amaral on 15/12/22.
//

import SwiftUI
import Common
import Domain

public protocol CharacterViewable: ViewLoadable {
    
    func show(message: String)
}

public class CharacterHomeViewModel: ObservableObject {
    
    @Published public var data: [CharacterModel] = []
    @Published var searchTerm: String = ""
    @Published var isLoading: Bool = false
    
    private var offset: Int = 0
    private var totalPages: Int = 0
    
    private weak var view: CharacterViewable?
    private var coordinator: CharacterHomeCoordinating?
    private let characterUseCase: CharacterUseCaseProtocol
    
    public init(coordinator: CharacterHomeCoordinating,
                characterUseCase: CharacterUseCaseProtocol) {
        self.characterUseCase = characterUseCase
        self.coordinator = coordinator
    }
    
    public func attach(_ view: CharacterViewable) {
        self.view = view
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
                self.data.append(contentsOf: (response.results?.compactMap { CharacterModel($0) }) ?? [])
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
    
    public func nextScreen() {
        print("Próxima tela")
    }
    
    public func previousScreen() {
        print("Tela anterior")
    }
}
