//
//  File.swift
//
//
//  Created by NMAS Amaral on 09/01/23.
//

import SwiftUI

public struct ComicsView: View {
    
    @ObservedObject var viewModel: ComicsViewModel
    @State private var selection = 0
    
    public var borderColor: Color = .black
    
    private func createBorder(borderColor: Color) -> some View {
        return RoundedRectangle(cornerRadius: 0)
            .stroke(borderColor, lineWidth: 1.5)
    }
    
    public init(viewModel: ComicsViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Properties
    
    @State private var searchTerm: String = ""
    @State private var buttonImage: String = "icon-favorite"
    
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
        }
    }
}

