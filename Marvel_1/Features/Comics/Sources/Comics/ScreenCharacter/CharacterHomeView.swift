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
    @State private var buttonImage = "icon-favorite"
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
                        Text(L10n.Characters.Title.tile)
                            .font(Font.custom("Bangers-Regular", size: 40))
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                            .padding(.leading, 24)
                            .padding(.top, -36)
            
                        VStack {
                            if #available(iOS 14.0, *) {
                                CharacterHomeListView(viewModel: viewModel, buttonImage: $buttonImage, borderColor: borderColor)
                                    .padding(.bottom, 1)
                            } else {}
                        }
                    }
        }.navigationBarBackButtonHidden(true)
    }
}
