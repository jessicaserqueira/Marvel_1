//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 22/02/23.
//

import Foundation
import UIKit

public class ScreenDetailsCharacterViewModel: ObservableObject {
    
    private var coordinator: ScreenDetailsCharacterCoordinating?
    
    public init(coordinator: ScreenDetailsCharacterCoordinating) {
        self.coordinator = coordinator
    }
    
    //MARK: - Properties
#warning("TODO")
}

//MARK: - ScreenHomeModelling
extension ScreenDetailsCharacterViewModel: ScreenDetailsCharacterModelling {}
