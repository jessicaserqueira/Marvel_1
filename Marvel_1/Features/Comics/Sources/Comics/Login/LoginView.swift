//
//  File.swift
//  
//
//  Created by NMAS Amaral on 07/03/23.
//

import Kingfisher
import SwiftUI

public struct LoginView<ViewModel: LoginModelling>: View {
    @ObservedObject var viewModel: ViewModel
    
    public init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    public var borderColor: Color = .black
    
    public var body: some View {
        ZStack(alignment: .top) {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.86)
            
            VStack {
                HStack {
                    Spacer()
                    Text(L10n.Splash.title)
                        .font(Font.custom("Bangers-Regular", size: 50))
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                .padding()
                .padding(.top)
                .multilineTextAlignment(.center)
                
                Spacer()
                HStack {
                    LoginTextField(email: $viewModel.loginModel.email, borderColor: .black)
                    
                    Spacer()
                    
                }
                .padding()
                HStack {
                    PasswordTextField(password: $viewModel.loginModel.password, borderColor: .black)
                    
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
                    viewModel.loginAuthentication(email: viewModel.loginModel.email, password: viewModel.loginModel.password)
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
                .alert(isPresented: $viewModel.formInvalid) {
                    Alert(title: Text(viewModel.alertText), dismissButton: .default(Text("OK")))
                }
            }
            .padding()
        }.navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
}
