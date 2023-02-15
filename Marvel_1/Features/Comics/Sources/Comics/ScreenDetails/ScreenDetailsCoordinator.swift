//
//  File.swift
//  
//
//  Created by NMAS Amaral on 30/12/22.
//

import Foundation
import SwiftUI


public struct ScreenDetailsCoordinator: View {
    class ViewModel: ObservableObject {
        let screenDetailsModel: ScreenDetailsModel
        
        public init(screenDetailsViewModel: ScreenDetailsModel) {
            self.screenDetailsModel = screenDetailsViewModel
        }
    }
    
    @ObservedObject var viewModel: ViewModel
    
    public init(viewModel: ScreenDetailsModel) {
        self.viewModel = .init(screenDetailsViewModel: viewModel)
    }
    
    public var body: some View {
        ScreenDetailsView()
    }
}

extension ScreenDetailsCoordinator {
    
    class ScreenDetailsViewCoordinator: ScreenDetailsCoordinating {
        
        weak var rootViewController: UINavigationController?
    }
}
