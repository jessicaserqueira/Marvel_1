//
//  File 3.swift
//  
//
//  Created by Jessica Serqueira on 23/02/23.
//

import SwiftUI
import Kingfisher

public struct DetailsComicsView<ViewModel: DetailsComicsModelling>: View {
    @ObservedObject var viewModel: ViewModel
    var selectedItemId: Int
    
    private var currentCharacter: ComicsModel? {
        viewModel.data.first
    }
    
    private var selectedCharacterId: Int {
        selectedItemId
    }
    
    // MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    public var borderColor: Color = .black
    
    private func createBorder(borderColor: Color) -> some View {
        RoundedRectangle(cornerRadius: 0)
            .stroke(borderColor, lineWidth: 1.5)
    }
    
    public var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                if let currentCharacter {
                    KFImage(URL(string: "\(currentCharacter.thumbnail)"))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
                        .clipped()
                }
                
                VStack {
                    Spacer().frame(height: 15)
                    ZStack(alignment: .top, content: {
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.05)
                            .scaleEffect()
                            .overlay(createBorder(borderColor: Color.black))
                            .foregroundColor(Color.white)
                        
                        
                        VStack {
                            ZStack {
                                Text(currentCharacter?.title ?? "")
                                    .font(Font.custom("Bangers-Regular", size: UIScreen.main.bounds.height * 0.03))
                                    .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.05, alignment: .leading)
                                    .multilineTextAlignment(.leading)
                                    .padding(.top,8)
                                    .padding(.leading, 8)
                            }.padding(-8)
                        }
                    })
                    
                    ZStack(content: {
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.30)
                            .scaleEffect()
                            .overlay(
                                ScrollView {
                                    VStack {
                                        if let resultDescription = currentCharacter?.textObjects, !resultDescription.isEmpty {
                                            Text(resultDescription.first ?? "")
                                                .font(Font.custom("Nunito-Regular", size: UIScreen.main.bounds.height * 0.02))
                                                .foregroundColor(.black)
                                                .multilineTextAlignment(.center)
                                                .padding(16)
                                        } else {
                                            Text("Infelizmente não foi localizada a descrição deste personagem.")
                                                .font(Font.custom("Nunito-Regular", size: UIScreen.main.bounds.height * 0.02))
                                                .foregroundColor(.black)
                                                .multilineTextAlignment(.center)
                                                .padding(16)
                                        }
                                    }
                                }
                            )
                            .overlay(createBorder(borderColor: Color.black))
                    })
                    .padding(.bottom, 50)
                }
            }
            .onAppear {
                viewModel.fetchComicsDetails(with: selectedItemId)
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.backward")
            }
        )
    }
}
