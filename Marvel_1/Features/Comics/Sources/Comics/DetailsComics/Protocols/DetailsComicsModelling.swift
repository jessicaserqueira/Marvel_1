//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 23/02/23.
//

import Foundation

@MainActor
public protocol DetailsComicsModelling: ObservableObject {
    var data: [ComicsModel] { get }
    
    func fetchComicsDetails(with id: Int)
}
