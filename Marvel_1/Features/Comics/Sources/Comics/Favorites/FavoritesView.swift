//
//  File.swift
//
//
//  Created by NMAS Amaral on 09/01/23.
//

import SwiftUI

struct FavoritesView<ViewModel: FavoritesModelling>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    public init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    public var borderColor: Color = .black
    
    public var body: some View {
        ZStack(alignment: .top) {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.top)
            
            VStack(alignment: .leading) {
                Text(L10n.Favorites.title)
                    .font(Font.custom("Bangers-Regular", size: 40))
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 24)
                    .padding(.top, -36)
                
                VStack {
                    FavoritesListView(viewModel: viewModel, borderColor: borderColor)
                        .padding(.bottom, 1)
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}
