//
//  File.swift
//
//
//  Created by NMAS Amaral on 09/01/23.
//

import SwiftUI

@MainActor
public struct FavoritesView: View {
    
    @ObservedObject var viewModel: FavoritesViewModel
    @State private var selection = 0
    
    public init(viewModel: FavoritesViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Properties
    
    public var borderColor: Color = .black
    @State private var searchTerm: String = ""
    @State private var buttonImage: String = "icon-favorite"
    
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
                    HStack {
                        Button(action: {
                            // Realizar a pesquisa aqui usando o searchTerm
                        }) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.black)
                        }
                        if #available(iOS 15.0, *) {
                            TextField("", text: $searchTerm, prompt: Text(L10n.FindFavorites.Search.placeHolder).foregroundColor(.black.opacity(0.5)))
                                .font(Font.custom("Nunito-Medium", size: 16))
                                .foregroundColor(.black)
                                .background(Color.clear)
                        } else {
                            
                        }
                    }.padding(12)
                        .frame(height: 45)
                        .background(Color.black.opacity(0.2))
                        .overlay(RoundedRectangle(cornerRadius: 0).stroke(borderColor, lineWidth: 2))
                }.padding(.leading, 24)
                    .padding(.trailing, 24)
            }
            
            VStack {
                Spacer()
                Image("notFound")
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100, alignment: .center)
                
                Text(L10n.NotFoundFavorite.text)
                    .font(Font.custom("Nunito-Bold", size: 20))
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .padding(.leading, 70)
                    .padding(.trailing, 70)
                Spacer()
            }
        }
    }
}
