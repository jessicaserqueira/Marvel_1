//
//  File.swift
//
//
//  Created by NMAS Amaral on 09/01/23.
//

import SwiftUI

@MainActor
public struct HQView: View {
    
    @ObservedObject var viewModel: HQViewModel
    @State private var selection = 0
    
    public var borderColor: Color = .black
    
    private func createBorder(borderColor: Color) -> some View {
        return RoundedRectangle(cornerRadius: 0)
            .stroke(borderColor, lineWidth: 1.5)
    }
    
    public init(viewModel: HQViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Properties
    
    @State private var searchTerm: String = ""
    @State private var buttonImage: String = "icon-favorite"
    
    public var body: some View {
        ZStack(alignment: .top) {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.top)
            
                VStack(alignment: .leading) {
                    Text(L10n.MarvelHQ.title)
                        .font(Font.custom("Bangers-Regular", size: 40))
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                    
                    VStack {
                        HStack {
                            Button(action: {
                                // Realizar a pesquisa aqui usando o searchTerm
                            }) {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.black)
                            }
                            if #available(iOS 15.0, *) {
                                TextField("", text: $searchTerm, prompt: Text(L10n.FindHQName.Search.placeHolder).foregroundColor(.black.opacity(0.5)))
                                    .font(Font.custom("Nunito-Medium", size: 16))
                                    .foregroundColor(.black)
                                    .background(Color.clear)
                            } else {

                            }
                        }
                        .padding(12)
                        .frame(height: 45)
                        .background(Color.black.opacity(0.2))
                        .overlay(RoundedRectangle(cornerRadius: 0).stroke(borderColor, lineWidth: 2))
                    }
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color.white)
                            .frame(height: 198)
                            .overlay(createBorder(borderColor: Color.black))
                        HStack (alignment: .top, content: {
                            Button(action: {
                            }) {
                                Rectangle()
                                    .foregroundColor(Color.white)
                                    .frame(width: 140, height: 182, alignment: .leading)
                                    .foregroundColor(Color.white)
                                    .overlay(createBorder(borderColor: Color.black))
                                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                            }

                            VStack {
                                HStack {
                                    ZStack {
                                        Rectangle()
                                            .foregroundColor(Color.white)
                                            .frame(width: 178, height: 34)
                                            .overlay(createBorder(borderColor: Color.black))
                                                                                Text("Os vingadores edição #49")
                                                                                    .font(Font.custom("Bangers-Regular", size: 16))
                                    }
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8))
                                }
                                Text("Spider-Man vs. the Sinister Syndicate -- the FINAL SHOWDOWN! The odds don't look good for the Wall-Crawler… but that's never stopped Spidey before!")
                                    .font(Font.custom("Nunito-Regular", size: 12))
                                    .foregroundColor(.primary)
                                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                            }
                        })
                    }
                    .padding(.top, 32)
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color.white)
                            .frame(height: 198)
                            .overlay(createBorder(borderColor: Color.black))
                        HStack (alignment: .top, content: {
                            Button(action: {
                            }) {
                                Rectangle()
                                    .foregroundColor(Color.white)
                                    .frame(width: 140, height: 182, alignment: .leading)
                                    .foregroundColor(Color.white)
                                    .overlay(createBorder(borderColor: Color.black))
                                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                            }

                            VStack {
                                HStack {
                                    ZStack {
                                        Rectangle()
                                            .foregroundColor(Color.white)
                                            .frame(width: 178, height: 75)
                                            .overlay(createBorder(borderColor: Color.black))
                                        
                                        Text("Os vingadores em algum lugar defendendo os Eua edição #51")
                                            .font(Font.custom("Bangers-Regular", size: 16))
                                            .padding(.trailing, 8)
                                            .padding(.leading, 8)
                                    }
                                }
                                Text("On the edge of alcoholism and a failed marriage, Bob Reynolds wakes up to discover his true nature. A forgotten hero...")
                                    .font(Font.custom("Nunito-Regular", size: 12))
                                    .foregroundColor(.primary)
                                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                            }
                        })
                    }.padding(.top, 32)
                }
                .padding(.trailing, 24)
                .padding(.leading, 24)
        }
    }
}

