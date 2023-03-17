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
    @State private var isFavorite: Bool = false
    
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
                Text(L10n.Characters.Title.title)
                    .font(Font.custom("Bangers-Regular", size: 40))
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 24)
                    .padding(.top, -36)
                
                VStack {
                    if #available(iOS 14.0, *) {
                        CharacterHomeListView(viewModel: viewModel, borderColor: borderColor)
                            .padding(.bottom, 1)
                    } else {}
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}
