//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 17/03/23.
//

import SwiftUI
import Kingfisher

@available(iOS 14.0, *)
struct FavoritesListView<ViewModel: FavoritesModelling>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var borderColor: Color
    var gridItemLayout = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                    
                }
            }
        }
        
    }
