//
//  File.swift
//  
//
//  Created by NMAS Amaral on 30/12/22.
//

import Foundation
import SwiftUI


public struct ScreenDetailsViewCoordinator: View {
    class ViewModel: ObservableObject {
        let screenDetailsViewModel: ScreenDetailsViewModel
        
        public init(screenDetailsViewModel: ScreenDetailsViewModel) {
            self.screenDetailsViewModel = screenDetailsViewModel
        }
    }
    
    @ObservedObject var viewModel: ViewModel
    
    public init(viewModel: ScreenDetailsViewModel) {
        self.viewModel = .init(screenDetailsViewModel: viewModel)
    }
    
    public var body: some View {
        ScreenDetailsView()
    }
}

extension ScreenDetailsViewCoordinator {
    
    class ScreenDetailsViewCoordinator: ScreenDetailsViewCoordinating {
        
        weak var rootViewController: UINavigationController?
        
        public func backScreen() {
#warning("Implement function")
            print("Tela Anterior")
            rootViewController?.popViewController(animated: true)
        }
    }
}
