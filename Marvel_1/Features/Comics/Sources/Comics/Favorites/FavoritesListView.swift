//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 17/03/23.
//

import SwiftUI
import Kingfisher

struct FavoritesListView<ViewModel: FavoritesModelling>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var borderColor: Color
    var gridItemLayout = Array(repeating: GridItem(.flexible()), count: 3)

    var body: some View {
        VStack {
            SearchBar(searchTerm: $viewModel.searchTerm, borderColor: borderColor)
                .padding(.horizontal, 24)
            if !viewModel.isLoading {
                ScrollViewReader { value in
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: self.gridItemLayout, alignment: .center) {
                            ForEach(viewModel.filteredCharacters, id: \.id) { character in
                                VStack(alignment: .center) {
                                    Button(action: {
                                        // action code
                                    }) {
                                        KFImage(character.thumbnail)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 100, height: 100)
                                            .overlay(RoundedRectangle(cornerRadius: 0).stroke(self.borderColor, lineWidth: 2))
                                    }
                                    HStack(spacing: 10) {
                                        Text(character.name)
                                            .font(Font.custom("Bangers-Regular", size: 14))
                                        FavoriteButton(isFavoriteButtonActive: viewModel.isFavoriteButtonActive(for: character))
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
                    }
                    .gesture(DragGesture().onChanged({ _ in
                        UIApplication.shared.endEditing()
                    }))
                }
            } else {
                ActivityIndicator(isAnimating: $viewModel.isLoading)
            }
        }
        .onAppear {
            viewModel.didAppear()
        }
    }
}
