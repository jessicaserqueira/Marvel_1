////
////  File.swift
////
////
////  Created by NMAS Amaral on 03/03/23.
////
//
//import Foundation
//import Combine
//
//class CharacterCardViewModel: ObservableObject {
//    @Published var characterRepository = CharacterRepository()
//    @Published var characterHomeViewModel = [CharacterHomeViewModel]()
//
//    private var cancellabels = Set<AnyCancellable>()
//
//    init() {
//        characterRepository.$character
//            .map { character in
//                character.map { character in
//                    characterHomeViewModel(character: character)
//                }
//            }
//            .assign(to: \.characterHomeViewModel, on: self)
//            .store(in: &cancellabels)
//    }
//
//    func addCharacter(character: CharacterRepository) {
//        characterRepository.addFavorite(character)
////        let characterVM = characterHomeViewModel(character: character)
////        self.characterHomeViewModel.append(characterVM)
//    }
//}
