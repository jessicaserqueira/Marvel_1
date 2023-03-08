//
//  SignupView.swift
//  SwiftUI-Auth
//
//  Created by Derek Hsieh on 1/7/23.
//

import SwiftUI
import FirebaseAuth

struct CreateAccountView <ViewModel: CreateAccountModelling> : View {
    @State private var email = String()
    @State private var password = String()
    @ObservedObject var viewModel: ViewModel
    //    @AppStorage("uid") var userID: String = ""
    //    @Binding var currentShowingView: String
    
    public init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        ZStack {
            
            Image("splash")
                .resizable()
            //                .edgesIgnoringSafeArea(.all)
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
                    viewModel.returnLoginView()
                }) {
                    Text(L10n.CreateAccount.Ask.title)
                        .foregroundColor(.black.opacity(0.7))
                }
                
                Spacer()
                Spacer()
                
                
                Button {
                    viewModel.createAccount()
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
            
        }
    }
    //        ZStack {
    //            Color.black.edgesIgnoringSafeArea(.all)
    //
    //            VStack {
    //                HStack {
    //                    Text("Create an Account!")
    //                        .foregroundColor(.white)
    //                        .font(.largeTitle)
    //                        .bold()
    //
    //                    Spacer()
    //                }
    //                .padding()
    //                .padding(.top)
    //
    //                Spacer()
    //
    //                HStack {
    //                    Image(systemName: "mail")
    //                    TextField("Email", text: $email)
    //
    //                    Spacer()
    //
    //
    //                    if(email.count != 0) {
    //
    //                        Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
    //                            .fontWeight(.bold)
    //                            .foregroundColor(email.isValidEmail() ? .green : .red)
    //                    }
    //
    //                }
    //                .foregroundColor(.white)
    //                .padding()
    //                .overlay(
    //                    RoundedRectangle(cornerRadius: 10)
    //                        .stroke(lineWidth: 2)
    //                        .foregroundColor(.white)
    //
    //                )
    //
    //                .padding()
    //
    //
    //                HStack {
    //                    Image(systemName: "lock")
    //                    SecureField("Password", text: $password)
    //
    //                    Spacer()
    //
    //                    if(password.count != 0) {
    //
    //                        Image(systemName: isValidPassword(password) ? "checkmark" : "xmark")
    //                            .fontWeight(.bold)
    //                            .foregroundColor(isValidPassword(password) ? .green : .red)
    //                    }
    //
    //                }
    //                .foregroundColor(.white)
    //                .padding()
    //                .overlay(
    //                    RoundedRectangle(cornerRadius: 10)
    //                        .stroke(lineWidth: 2)
    //                        .foregroundColor(.white)
    //
    //                )
    //                .padding()
    //
    //
    //                Button(action: {
    //                    withAnimation {
    //                        self.currentShowingView = "login"
    //                    }
    //                }) {
    //                    Text("Already have an account?")
    //                        .foregroundColor(.gray)
    //                }
    //
    //                Spacer()
    //                Spacer()
    //
    //
    //                Button {
    //
    //
    //                    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
    //
    //                        if let error = error {
    //                            print(error)
    //                            return
    //                        }
    //
    //                        if let authResult = authResult {
    //                            print(authResult.user.uid)
    //                            userID = authResult.user.uid
    //
    //                        }
    //                    }
    //
    //                } label: {
    //                    Text("Create New Account")
    //                        .foregroundColor(.black)
    //                        .font(.title3)
    //                        .bold()
    //
    //                        .frame(maxWidth: .infinity)
    //                        .padding()
    //
    //                        .background(
    //                            RoundedRectangle(cornerRadius: 10)
    //                                .fill(Color.white)
    //                        )
    //                        .padding(.horizontal)
    //                }
    //
    //
    //            }
    //
    //        }
}
