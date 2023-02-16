//
//  File.swift
//
//
//  Created by NMAS Amaral on 09/01/23.
//

import SwiftUI

public struct ComicsView: View {
    
    @ObservedObject var viewModel: ComicsViewModel
    
    public init(viewModel: ComicsViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Properties
    
    @State private var searchTerm: String = ""
    
    public var body: some View {
        Image("background")
            .resizable()
            .edgesIgnoringSafeArea(.top)
            .overlay(
                VStack {
                    VStack(alignment: .leading) {
                        Text(L10n.MarvelHQ.title)
                            .font(Font.custom("Bangers-Regular", size: 40))
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.leading)
                    }
                    
                    if #available(iOS 14.0, *) {
                        ComicsListView(viewModel: viewModel)
                            .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25))
                        
                    } else {
                    }
                }
            )
    }
}
