//
//  SplashScreenView.swift
//  Marvel
//
//  Created by NMAS Amaral on 05/01/23.
//

import SwiftUI

struct SplashScreenView: View {
    
    var body: some View {
        ZStack {
            Image("splash")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            Image("backgroudSplash")
                
            Text("Marvel \nComics")
                .font(Font.custom("Bangers-Regular", size: 64))
                .foregroundColor(Color.black)
        }
    }
}
