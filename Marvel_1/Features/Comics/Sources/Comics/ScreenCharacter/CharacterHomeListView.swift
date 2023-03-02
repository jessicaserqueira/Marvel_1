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
    @Binding var buttonImage: String
    @State private var searchTerm: String = ""
    @State var isAnimating: Bool = true
    @State var selectedCharacterId: Int?
    
    var borderColor: Color
    var gridItemLayout = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        SearchBar(searchTerm: $searchTerm, borderColor: borderColor)
            .padding(.horizontal, 24)
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                LazyVGrid(columns: self.gridItemLayout, alignment: .center) {
                    ForEach(self.viewModel.filterCharacters(searchTerm: self.searchTerm), id: \.uniqueId) { i in
                        VStack(alignment: .center) {
                            Button(action: {
                                viewModel.buttonDetails(with: i.id ?? 0)
                                selectedCharacterId = i.id
        
                            }) {
                                KFImage(URL(string: "\(i.thumbnail)"))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                                    .overlay(RoundedRectangle(cornerRadius: 0).stroke(self.borderColor, lineWidth: 2))
                            }
                            HStack(spacing: 10) {
                                Text(i.name)
                                    .font(Font.custom("Bangers-Regular", size: 14))
                                FavoriteButton(action: self.viewModel.favoriteButton, buttonImage: self.$buttonImage)
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
                if viewModel.isLoading {
                    ActivityIndicator(isAnimating: $isAnimating)
                }
            }
        }
        .padding(.horizontal, 12)
    }
}
