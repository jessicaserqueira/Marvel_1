//
//  File.swift
//
//
//  Created by NMAS Amaral on 30/12/22.
//
import Foundation
import UIKit

public class ScreenDetailsViewModel: ObservableObject {
    
    public init() {
        
    }
    
    //MARK: - Properties
#warning("TODO")
//    let coordinator: ScreenDetailsViewCoordinating
//
//    public init(coordinator: ScreenDetailsViewCoordinating) {
//        self.coordinator = coordinator
//    }
}

//MARK: - ScreenHomeModelling
extension ScreenDetailsViewModel: ScreenDetailsViewModelling {
    
    public func backScreen() {
        print("Tela anterior")
//        coordinator.backScreen()
    }
}
