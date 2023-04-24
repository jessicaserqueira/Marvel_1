//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 25/01/23.
//

import SwiftUI


struct FavoriteButton: View {

    @Binding var isFavoriteButtonActive: Bool

    var body: some View {
        Button(action: {
            isFavoriteButtonActive.toggle()
        }) {
            Image(isFavoriteButtonActive ? "icon-favoriteColor" : "icon-favorite")
                .padding(.leading, 12)
        }
    }
}
