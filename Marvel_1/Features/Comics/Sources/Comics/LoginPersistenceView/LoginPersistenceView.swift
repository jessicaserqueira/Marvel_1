//
//  File.swift
//  
//
//  Created by NMAS Amaral on 17/03/23.
//

import SwiftUI
import Common

@available(iOS 14.0, *)
struct LoginPersistenceView<ViewModel: LoginPersistenceModelling>: View {
    
    @ObservedObject var viewModel: ViewModel
    var navigationController = UINavigationController()
    var tabBarController = UITabBarController()
    var container = DIContainer()
    
    public init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        ZStack {
            if viewModel.isLogged {
                let coordinator = CharacterHomeCoordinator(tabBarController: tabBarController)
                let viewModel = CharacterHomeViewModel(coordinator: coordinator)
                CharacterHomeView(viewModel: viewModel)
            } else {
                let coordinator = LoginCoordinator(navigationController: navigationController, tabBarController: tabBarController, container: container)
                let viewModel = LoginViewModel(coordinator: coordinator)
                LoginView(viewModel: viewModel)
            }
        }.onAppear {
            viewModel.onAppear()
        }
    }
}
