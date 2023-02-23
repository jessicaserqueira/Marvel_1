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
    var isLoading: Bool { get }
    
    func didAppear()
    func fetchComics()
    func filterComics(searchTerm: String) -> [ComicsModel]
    func buttonDetails()
}
