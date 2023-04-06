//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 08/02/23.
//

import SwiftUI
import Kingfisher

struct ComicsListView<ViewModel: ComicsModelling>: View {
    
    @ObservedObject var viewModel: ViewModel
    @State var isAnimating: Bool = true
    @State var selectedComicsId: Int?
    
    private let borderColor: Color = .black
    private let comicImageWidth: CGFloat = 140
    private let comicImageHeight: CGFloat = 182
    private let comicContainerHeight: CGFloat = 198
    
    private var borderStroke: some View {
        RoundedRectangle(cornerRadius: 0)
            .stroke(borderColor, lineWidth: 1.5)
    }
    
    var body: some View {
        HStack {
            SearchBar(searchTerm: $viewModel.searchTerm, borderColor: borderColor)
                .padding(.leading, 24)
                .padding(.trailing, 24)
        }
        ScrollViewReader { value in
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(viewModel.filterComics, id: \.id) { i in
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(Color.white)
                                .frame(height: comicContainerHeight)
                                .overlay(borderStroke)
                            
                            HStack (alignment: .top, content: {
                                Button(action: {
                                    viewModel.buttonDetails(with: i.id ?? 0)
                                    selectedComicsId = i.id
                                }) {
                                    KFImage(URL(string: "\(i.thumbnail)"))
                                        .placeholder {
                                            Image(systemName: "photo")
                                                .foregroundColor(.gray)
                                                .opacity(0.4)
                                        }
                                        .resizable()
                                        .foregroundColor(Color.white)
                                        .frame(width: 140, height: 182, alignment: .leading)
                                        .overlay(borderStroke)
                                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                        
                                }
                                
                                VStack {
                                    HStack {
                                        ZStack {
                                            Rectangle()
                                                .foregroundColor(Color.white)
                                                .frame(width: 178, height: 34)
                                                .overlay(borderStroke)
                                            Text(i.title)
                                                .font(Font.custom("Bangers-Regular", size: 12))
                                        }
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8))
                                    }
                                    Text(i.textObjects.first ?? "")
                                        .font(Font.custom("Nunito-Regular", size: 12))
                                        .foregroundColor(.primary)
                                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                                    
                                        .lineLimit(8)
                                        .multilineTextAlignment(.leading)
                                        .truncationMode(.tail)
                                }
                            })
                        }
                        .padding(.top, 32)
                    }
                }.padding(.leading, 24)
                    .padding(.trailing, 24)
                    .onAppear {
                        viewModel.didAppear()
                    }
                    .padding(10)
                    .onChange(of: viewModel.offset) { currentPage in
                        if currentPage == viewModel.totalPages {
                            return
                        }
                        viewModel.fetchComics()
                    }
                if viewModel.isLoading {
                    ActivityIndicator(isAnimating: $isAnimating)
                }
            }
            .gesture(DragGesture().onChanged({ _ in
                UIApplication.shared.endEditing()
            }))
        }
    }
}
