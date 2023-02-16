//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 25/01/23.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchTerm: String
    public var borderColor: Color = .black
    
    var body: some View {
        HStack {
            Button(action: {
                // Realizar a pesquisa aqui usando o searchTerm
            }) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.black)
            }
            if #available(iOS 15.0, *) {
                TextField("", text: $searchTerm, prompt: Text(L10n.FindComic.Search.placeHolder).foregroundColor(.black.opacity(0.5)))
                    .font(Font.custom("Nunito-Medium", size: 16))
                    .foregroundColor(.black)
                    .background(Color.clear)
            } else {
                // Fallback on earlier versions
            }
        
        }
        .padding(12)
        .frame(height: 45)
        .background(Color.black.opacity(0.2))
        .overlay(RoundedRectangle(cornerRadius: 0).stroke(borderColor, lineWidth: 2))
    }
}
