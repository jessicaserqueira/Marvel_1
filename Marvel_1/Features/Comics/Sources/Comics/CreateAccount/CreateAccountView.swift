//
//  SignupView.swift
//  SwiftUI-Auth
//
//  Created by Derek Hsieh on 1/7/23.
//

import SwiftUI
import FirebaseAuth

struct CreateAccountView <ViewModel: CreateAccountModelling> : View {
    @ObservedObject var viewModel: ViewModel
    @State private var showModal = false
    
    public init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text(L10n.CreateAccount.Label.title)
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }
                .padding()
                .padding(.top)
                Spacer()
                HStack {
                    LoginTextField(email: $viewModel.createAccount.email, borderColor: .black)
                    Spacer()
                }
                .padding()
                HStack {
                    PasswordTextField(password: $viewModel.createAccount.password, borderColor: .black)
                    Spacer()
                }
                .padding()
                Button(action: {
                    viewModel.returnLoginView()
                }) {
                    Text(L10n.CreateAccount.Ask.title)
                        .foregroundColor(.black.opacity(0.7))
                }
                Spacer()
                Spacer()
                VStack {
                    Button {
                        viewModel.buttonCreateAccount()
                        self.showModal = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            self.showModal = false
                        }
                    } label: {
                        Text(L10n.CreateAccount.Button.title)
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
                if showModal {
                    ModalView()
                        .frame(width: 328, height: 70)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .transition(.move(edge: .bottom))
                        .animation(.spring())
                        .padding(.bottom, 20)
                }
            }.navigationBarBackButtonHidden(true)
        }
    }
}
