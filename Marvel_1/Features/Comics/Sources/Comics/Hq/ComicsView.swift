//
//  File.swift
//
//
//  Created by NMAS Amaral on 09/01/23.
//

import SwiftUI

@MainActor
public struct ComicsView: View {
    
    @ObservedObject var viewModel: ComicsViewModel
    
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
            
            VStack {
                if #available(iOS 14.0, *) {
                    ComicsListView(viewModel: viewModel)
                        .padding(20)
                } else {
                }
            }
        }
    }
}
