//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 22/02/23.
//

import Foundation
import UIKit

public class DetailsCharacterViewModel: ObservableObject {
    
    private var coordinator: DetailsCharacterCoordinating?
    
    public init(coordinator: DetailsCharacterCoordinating) {
        self.coordinator = coordinator
    }
    
    //MARK: - Properties
#warning("TODO")
}

//MARK: - ScreenHomeModelling
extension DetailsCharacterViewModel: DetailsCharacterModelling {}
