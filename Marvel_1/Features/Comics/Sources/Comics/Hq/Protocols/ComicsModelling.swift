//
//  File.swift
//  
//
//  Created by NMAS Amaral on 09/01/23.
//

import Foundation

@MainActor
public protocol ComicsModelling: ObservableObject{
    
    var data: [ComicsModel] { get }
    var isLoading: Bool { get set }
    var searchTerm: String { get set }
    var offset: Int { get set}
    var totalPages: Int { get set }
    
    func didAppear()
    func fetchComics()
    func buttonDetails(with id: Int)
}

extension ComicsModelling {
    
    var filterComics: [ComicsModel] {
        let filteredCharacters = searchTerm.isEmpty ? data : data.filter {
            $0.title.lowercased().contains(searchTerm.lowercased())
        }
        return filteredCharacters.sorted(by: { $0.title < $1.title })
    }
}
