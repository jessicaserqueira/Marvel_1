//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 25/01/23.
//

import SwiftUI

struct FavoriteButton: View {
    
    let action: () -> Void
    @Binding var buttonImage: String
    
    var body: some View {
        Button(action: {
            self.action()
            self.buttonImage = self.buttonImage == "icon-favorite" ? "icon-favoriteColor" : "icon-favorite"
        }) {
            Image(buttonImage)
                .padding(.leading, 12)
        }
    }
}
