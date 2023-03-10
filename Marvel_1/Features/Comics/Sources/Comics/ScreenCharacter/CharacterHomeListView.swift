//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 25/01/23.
//

import Kingfisher
import SwiftUI

@available(iOS 14.0, *)
struct CharacterHomeListView<ViewModel: CharacterHomeModelling>: View {
    
    var viewModel: ViewModel
    @Binding var buttonImage: String
    @State var scrollOffset = CGPoint.zero
    
    var borderColor: Color
    var gridItemLayout = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                LazyVGrid(columns: self.gridItemLayout, alignment: .center) {
                    ForEach(self.viewModel.data, id: \.id) { i in
                        VStack(alignment: .center) {
                            KFImage(URL(string: "\(i.thumbnail)"))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .overlay(RoundedRectangle(cornerRadius: 0).stroke(self.borderColor, lineWidth: 2))
                            HStack(spacing: 10) {
                                Text(i.name)
                                    .font(Font.custom("Bangers-Regular", size: 14))
                                FavoriteButton(action: self.viewModel.nextScreen, buttonImage: self.$buttonImage)
                            }
                            .frame(width: 100, height: 30)
                            .overlay(RoundedRectangle(cornerRadius: 0).stroke(self.borderColor, lineWidth: 2))
                        }
                        .padding(6)
                        .background(Color.white)
                        .shadow(radius: 8)
                        .overlay(RoundedRectangle(cornerRadius: 0).stroke(self.borderColor, lineWidth: 2))
                    }
                    .padding(6)
                }
                .padding(10)
            }
        }
    }
}
