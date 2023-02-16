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
        Image("background")
            .resizable()
            .edgesIgnoringSafeArea(.top)
            .overlay(
                VStack {
                    VStack(alignment: .leading) {
                        Text(L10n.Characters.title)
                            .font(Font.custom("Bangers-Regular", size: 40))
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 10)
                    }
                    
                    if #available(iOS 14.0, *) {
                        CharacterHomeListView(viewModel: viewModel, buttonImage: $buttonImage, borderColor: borderColor)
                    }
                })
    }
}
