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
    
    private let borderColor: Color = .black
    private let comicContainerHeight: CGFloat = 198
    
    private var borderStroke: some View {
        RoundedRectangle(cornerRadius: 0)
            .stroke(borderColor, lineWidth: 1.5)
    }
    
    var body: some View {
        HStack {
            SearchBar(searchTerm: $viewModel.searchTerm, borderColor: borderColor)
                .padding(.horizontal, 24)
        }
        ScrollViewReader { value in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 24) {
                    ForEach(viewModel.filterComics, id: \.id) { i in
                        ZStack {
                            Rectangle()
                                .foregroundColor(Color.white)
                                .frame(height: comicContainerHeight)
                                .overlay(borderStroke)
                            
                            HStack(alignment: .top) {
                                Button(action: {
                                    viewModel.buttonDetails(with: i.id ?? 0)
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
                                        .padding(.leading, 8)
                                }
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    HStack {
                                        Text(i.title)
                                            .font(Font.custom("Bangers-Regular", size: 12))
                                            .foregroundColor(.black)
                                            .frame(width: 178, height: 34)
                                            .background(Color.white)
                                            .overlay(borderStroke)
                                        
                                        Spacer()
                                    }
                                    
                                    Text(i.textObjects.first ?? "")
                                        .font(Font.custom("Nunito-Regular", size: 12))
                                        .foregroundColor(.primary)
                                        .lineLimit(8)
                                        .multilineTextAlignment(.leading)
                                        .truncationMode(.tail)
                                        .padding(.horizontal, 8)
                                    
                                    Spacer()
                                }
                                .padding(.trailing, 8)
                            }
                        }
                    }
                }
                .padding(.horizontal, 24)
                .onAppear {
                    viewModel.didAppear()
                }
                .padding(.vertical, 10)
                .onChange(of: viewModel.offset) { currentPage in
                    if currentPage == viewModel.totalPages {
                        return
                    }
                    viewModel.fetchComics()
                }
                
                
                if viewModel.isLoading {
                    ActivityIndicator(isAnimating: $viewModel.isLoading)
                }
            }
            
        }
    }
}
