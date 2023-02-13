//
//  File.swift
//
//
//  Created by NMAS Amaral on 15/12/22.
//

import Kingfisher
import SwiftUI

public struct CharacterHomeView<ViewModel: CharacterHomeModelling>: View {
    
    @ObservedObject var viewModel: ViewModel
    @State private var selection = 0
    @State private var searchTerm: String = ""
    @State private var buttonImage = "icon-favorite"

    
    public init(viewModel: ViewModel, searchTerm: String = "") {
        self.viewModel = viewModel
        self.selection = selection
        self.searchTerm = searchTerm
    }
    
    // MARK: - Properties
    public var borderColor: Color = .black
    
    public var body: some View {
        
        TabView(selection: $selection) {
            ZStack(alignment: .top) {
                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(.top)
                
                    VStack(alignment: .leading) {
                        Text(L10n.Characters.tile)
                            .font(Font.custom("Bangers-Regular", size: 40))
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 20)
                            .padding(.leading, 24)
            
                        VStack {
                            if #available(iOS 14.0, *) {
                                CharacterHomeListView(viewModel: viewModel, buttonImage: $buttonImage, borderColor: borderColor)
                                    .padding(.bottom, 1)
                                    .padding(.top, 32)
                            } else {}
                        }
                    }
                Spacer()
            }
            .tabItem {
                selection == 0 ? Image("shield-Color") : Image("shield")
                Text(L10n.Characters.tile)
            }.tag(0)
            
            HQView(viewModel: HQViewModel())
                .tabItem {
                    selection == 1 ? Image("hq-Color") : Image("hq")
                    Text(L10n.Hq.title)
                }.tag(1)
            
            FavoritesView(viewModel: FavoritesViewModel())
                .tabItem {
                    selection == 2 ? Image("heart-Color") : Image("heart")
                    Text(L10n.Favorites.title)
                }.tag(2)
        }.navigationBarBackButtonHidden(true)
        .accentColor(Color.black)
        .onAppear() {
            viewModel.didAppear()
        }
    }
}
