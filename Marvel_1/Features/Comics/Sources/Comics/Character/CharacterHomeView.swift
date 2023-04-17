//
//  File.swift
//
//
//  Created by NMAS Amaral on 15/12/22.
//

import Kingfisher
import SwiftUI

struct CharacterHomeView<ViewModel: CharacterHomeModelling>: View {
    
    @ObservedObject var viewModel: ViewModel
    @State private var searchTerm: String = ""
    
    public init(viewModel: ViewModel, searchTerm: String = "") {
        self.viewModel = viewModel
        self.searchTerm = searchTerm
    }
    
    public var borderColor: Color = .black
    
    public var body: some View {
        ZStack(alignment: .top) {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.top)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(L10n.Characters.Title.title)
                        .font(Font.custom("Bangers-Regular", size: 40))
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 24)
                        .padding(.top, -36)
                    
                    Spacer()
                    
                    Button(action: {
                        viewModel.logout()
                    }) {
                        Text("Sair")
                            .font(Font.custom("Nunito-Medium", size: 20))
                        Image(systemName: "arrow.right.to.line")
                    }.foregroundColor(Color.black)
                        .padding(.trailing, 15)
                }
                
                VStack {
                    CharacterHomeListView(viewModel: viewModel, borderColor: borderColor)
                        .padding(.bottom, 1)
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}
