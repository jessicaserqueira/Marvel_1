//
//  File.swift
//  
//
//  Created by NMAS Amaral on 17/03/23.
//

import SwiftUI
import Common

@available(iOS 14.0, *)
public struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    public init() {
        
    }
    
    public var body: some View {
        ZStack {
            if viewModel.isLogged {
                let coordinator = CharacterHomeCoordinator(tabBarController: UITabBarController())
                let viewModel = CharacterHomeViewModel(coordinator: coordinator)
                CharacterHomeView(viewModel: viewModel)
                
            } else {
                
                let coordinator = LoginCoordinator(navigationController: UINavigationController(), tabBarController: UITabBarController(), container: DIContainer())
                let viewModel = LoginViewModel(coordinator: coordinator)
                LoginView(viewModel: viewModel)
            }
        }.onAppear {
            viewModel.onAppear()
        }
    }
}
