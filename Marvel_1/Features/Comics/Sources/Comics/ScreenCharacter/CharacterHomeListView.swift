//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 25/01/23.
//

import SwiftUI
import Kingfisher

@available(iOS 14.0, *)
struct CharacterHomeListView<ViewModel: CharacterHomeModelling>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var borderColor: Color
    var gridItemLayout = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        SearchBar(searchTerm: $viewModel.searchTerm, borderColor: borderColor)
            .padding(.horizontal, 24)
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                LazyVGrid(columns: self.gridItemLayout, alignment: .center) {
                    ForEach(self.viewModel.filterCharacters(searchTerm: viewModel.searchTerm), id: \.id) { character in
                        VStack(alignment: .center) {
                            Button(action: {
                                viewModel.buttonDetails(with: character.item.id ?? 0)
                                
                            }) {
                                KFImage(character.thumbnail) // Use the `thumbnail` property directly from `CharacterModel`
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                                    .overlay(RoundedRectangle(cornerRadius: 0).stroke(self.borderColor, lineWidth: 2))
                                
                            }
                            HStack(spacing: 10) {
                                Text(character.name)
                                    .font(Font.custom("Bangers-Regular", size: 14))
                                FavoriteButton(
                                    isFavoriteButtonActive: .init(
                                        get:  {
                                            viewModel.isFavorites.first(where:{ character.id == $0.id })?.isFavorite ?? false
                                        },
                                        set: { isFavorite in
                                            if isFavorite {
                                                viewModel.markAsFavorite(
                                                    characterID: character.id ?? 0,
                                                    isFavorite: isFavorite,
                                                    characterModel: character)
                                            } else {
                                                viewModel.unmarkAsFavorite(
                                                    characterID: character.id ?? 0,
                                                    isFavorite: isFavorite)
                                            }
                                            viewModel.isFavorites = viewModel.isFavorites.map {
                                                character.id == $0.id ? .init(id: $0.id, isFavorite: isFavorite) : $0
                                            }
                                        }
                                    )
                                )
                            }
                            .frame(width: 100, height: 30)
                            .overlay(RoundedRectangle(cornerRadius: 0).stroke(self.borderColor, lineWidth: 2))
                        }
                        .padding(6)
                        .background(Color.white)
                        .shadow(radius: 8)
                        .overlay(RoundedRectangle(cornerRadius: 0).stroke(self.borderColor, lineWidth: 2))
                    }
                    .padding(6)
                }
                .padding(10)
                .onAppear{
                    viewModel.didAppear()
                }
                ActivityIndicator(isAnimating: $viewModel.isLoading)
            }
        }
        .padding(.horizontal, 12)
    }
}
