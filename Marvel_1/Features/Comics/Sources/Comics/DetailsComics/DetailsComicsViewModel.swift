//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 23/02/23.
//

import Foundation
import UIKit

public class DetailsComicsViewModel: ObservableObject {
    
    private var coordinator: DetailsComicsCoordinating?
    
    public init(coordinator: DetailsComicsCoordinating) {
        self.coordinator = coordinator
    }
    
    //MARK: - Properties
#warning("TODO")
}

//MARK: - ScreenHomeModelling
extension DetailsComicsViewModel: DetailsComicsModelling {}
