//
//  File.swift
//
//
//  Created by NMAS Amaral on 30/12/22.
//
import Foundation
import UIKit

public class ScreenDetailsViewModel: ObservableObject {
    
    private var coordinator: ScreenDetailsCoordinating?
    
    public init(coordinator: ScreenDetailsCoordinating) {
        self.coordinator = coordinator
    }
    
    //MARK: - Properties
#warning("TODO")
}

//MARK: - ScreenHomeModelling
extension ScreenDetailsViewModel: ScreenDetailsModelling {}
