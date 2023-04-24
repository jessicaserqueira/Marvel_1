//
//  File.swift
//
//
//  Created by NMAS Amaral on 09/01/23.
//

import SwiftUI

struct ComicsView<ViewModel: ComicsModelling>: View {
    
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
                Text(L10n.MarvelHQ.title)
                    .font(Font.custom("Bangers-Regular", size: 40))
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 24)
                    .padding(.top, -36)
                
                VStack {
                    ComicsListView(viewModel: viewModel)
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}
