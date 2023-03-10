//
//  File.swift
//  
//
//  Created by NMAS Amaral on 10/03/23.
//

import Foundation
import SwiftUI

public struct ModalView: View {
    
    public var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text(L10n.Modal.NotficationSuccessCreate.title)
                    .font(Font.custom("Nunito-Medium", size: 18))
                    .foregroundColor(.white)
                
                Text(L10n.Modal.NotficationSuccessCreate.subTitle)
                    .font(Font.custom("Nunito-Regular", size: 14))
                    .foregroundColor(.white)
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
