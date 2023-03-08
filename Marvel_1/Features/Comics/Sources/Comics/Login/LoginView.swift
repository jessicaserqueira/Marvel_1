//
//  File.swift
//  
//
//  Created by NMAS Amaral on 07/03/23.
//

import Kingfisher
import SwiftUI
import FirebaseAuth

public struct LoginView<ViewModel: LoginModelling>: View {
    @ObservedObject var viewModel: ViewModel
    @State var email = String()
    @State var password = String()
    
    public init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    
    public var borderColor: Color = .black
    
    public var body: some View {
        ZStack {
            
            Image("splash")
                .resizable()
//                .edgesIgnoringSafeArea(.all)
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text(L10n.Splash.title)
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                }
                .padding()
                .padding(.top)
                
                Spacer()
                
                HStack {
                    LoginTextField(email: $email, borderColor: .black)
                    
                    Spacer()
                    
                }
                
                .padding()
                
                
                HStack {
                    PasswordTextField(password: $password, borderColor: .black)
                    
                    Spacer()
                    
                }
                .padding()
                
                
                Button(action: {
                    viewModel.createAccount()
                    
                    
                }) {
                    Text(L10n.Login.Label.title)
                        .foregroundColor(.black.opacity(0.7))
                }
                
                Spacer()
                Spacer()
                
                
                Button {
                    viewModel.loginButton()
                } label: {
                    Text(L10n.Login.Button.title)
                        .foregroundColor(.white)
                        .bold()
                    
                        .frame(maxWidth: .infinity)
                        .padding()
                    
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.black)
                        )
                        .padding(.horizontal)
                        .padding(.bottom, 30)
                }
                
                
            }
            
        }
    }
    
//    public var body: some View {
//
//        ZStack {
//            Image("splash")
//                .resizable()
//                .edgesIgnoringSafeArea(.all)
//
//            VStack(alignment: .center, content: {
//
//                Text(L10n.Splash.title)
//                    .font(Font.custom("Bangers-Regular", size: 64))
//                    .foregroundColor(.primary)
//                    .multilineTextAlignment(.leading)
//                    .padding(.top, -50)
//
//                LoginTextField(email: $email, borderColor: borderColor)
//                    .padding(.horizontal, 24)
//                    .padding(.bottom, 10)
//
//                PasswordTextField(password: $password, borderColor: borderColor)
//                    .padding(.horizontal, 24)
//
//                Button(action: {
//                    viewModel.loginButton()
//                }) {
//                    Text("Entrar")
//                            .fontWeight(.semibold)
//                            .foregroundColor(.black)
//                            .frame(width: 327, height: 48)
//                            .background(Color.yellow)
//                            .cornerRadius(10)
//                            .padding(.top, 30)
//                }
//
//            }).padding(.top, -50)
////                .padding(.bottom, 5)
//        }.navigationBarBackButtonHidden(true)
//    }
}
