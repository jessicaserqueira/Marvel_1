//
//  File.swift
//  
//
//  Created by NMAS Amaral on 07/03/23.
//

import SwiftUI

public struct PasswordTextField: View {
    
    @Binding var password: String
    public var borderColor: Color = .black
    
    private func isValidPassword(_ password: String) -> Bool {
        // minimum 6 characters long
        // 1 uppercase character
        // 1 special character
        
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
        
        return passwordRegex.evaluate(with: password)
    }
    
    public var body: some View {
        HStack {
            if #available(iOS 15.0, *) {
                SecureField("E-mail", text: $password, prompt: Text(L10n.Password.TextField.placeHolder).foregroundColor(.black))
                    .keyboardType(.numbersAndPunctuation)
                    .font(Font.custom("Nunito-Medium", size: 16))
                    .foregroundColor(.black)
                    .background(Color.clear)
                
                if(password.count != 0) {
                    
                    Image(systemName: isValidPassword(password) ? "checkmark" : "xmark")
                        .foregroundColor(isValidPassword(password) ? .green : .red)
                }
            } else {
                // Fallback on earlier versions
            }
        
        }
        .padding(12)
        .frame(width: 327,height: 48)
        .background(Color.white.opacity(0.2))
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(borderColor, lineWidth: 2))
    }
}
