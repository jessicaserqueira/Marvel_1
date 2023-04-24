//  File.swift
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
            ScrollViewReader { value in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ForEach(viewModel.filteredCharacters, id: \.id) { character in
                            VStack(alignment: .center) {
                                Button(action: {
                                    viewModel.buttonDetails(with: character.item.id)
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
                    .onAppear {
                        viewModel.didAppear()
                    }
                    ActivityIndicator(isAnimating: $viewModel.isLoading)
                }
                .gesture(DragGesture().onChanged({ _ in
                    UIApplication.shared.endEditing()
                }))
            }
        }
    }
}
