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
    @Published public var isFavorites: [CharacterIsFavoriteModel] = []
    @Published public var selectedCharacter: CharacterModel?
    @Published public var searchTerm: String = ""
    @Published public var isLoading: Bool = false
    @Published public var offset: Int = 0
    @Published public var totalPages: Int = 0
    
    private var coordinator: CharacterHomeCoordinating?
    private lazy var characterUseCase = DIContainer.shared.resolveSafe(Domain.CharacterUseCaseProtocol.self)
    
    public init(coordinator: CharacterHomeCoordinating) {
        self.coordinator = coordinator
    }
}

//MARK: - ScreenHomeModelling
extension CharacterHomeViewModel: CharacterHomeModelling {
    
    public func selectCharacter(_ character: CharacterModel) {
        selectedCharacter = character
    }
    
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
                self.data += response.results?.compactMap { CharacterModel($0) } ?? []
                
                for character in response.results ?? [] {
                    if let id = character.id {
                        let isFavorite = self.isFavorites.contains(where: { $0.id == id }) ? true : false
                        self.isFavorites.append(CharacterIsFavoriteModel(id: id, isFavorite: isFavorite))
                    }
                }
                
                self.offset += 20
                self.isLoading = false
            case .failure(let error):
                print(error.localizedDescription)
                self.isLoading = false
            }
        }
    }
    
    public func isFavoriteButtonActive(for character: CharacterModel) -> Binding<Bool> {
        Binding<Bool>(
            get: { [weak self] in
                guard self != nil else { return false }
                return UserDefaults.standard.bool(forKey: "isFavorite-\(character.id ?? 0)")
            },
            set: { [weak self] isFavorite in
                guard let self = self else { return }
                UserDefaults.standard.set(isFavorite, forKey: "isFavorite-\(character.id ?? 0)")
                UserDefaults.standard.synchronize()
                self.isFavorites = self.isFavorites.map {
                    $0.id == character.id ? CharacterIsFavoriteModel(id: $0.id, isFavorite: isFavorite) : $0
                }
                if isFavorite {
                    self.markAsFavorite(characterID: character.id ?? 0, isFavorite: isFavorite, characterModel: character)
                    self.coordinator?.getFavorites()
                } else {
                    self.unmarkAsFavorite(characterID: character.id ?? 0, isFavorite: isFavorite)
                }
            }
        )
    }
    
    @MainActor public func buttonDetails(with id: Int) {
        coordinator?.buttonDetails(with: id)
    }
    
    public func markAsFavorite(characterID: Int, isFavorite: Bool, characterModel: CharacterModel) {
        coordinator?.markAsFavorite(characterID: characterID, isFavorite: isFavorite, characterModel: characterModel)
    }
    
    public func unmarkAsFavorite(characterID: Int, isFavorite: Bool) {
        coordinator?.unmarkAsFavorite(characterID: characterID, isFavorite: isFavorite)
    }
    
    public func logout() {
        coordinator?.signOut()
    }
}
