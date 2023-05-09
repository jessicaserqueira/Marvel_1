//
//  SceneDelegate.swift
//  Marvel_1
//
//  Created by Jessica Serqueira on 02/02/23.
//

import UIKit
import AppNavigation
import DI
import SwiftUI
import Swinject
import SwinjectAutoregistration

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    private var injector: DI.DependencyInjector?
    private var navigationController = UINavigationController()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        if let window = window {
            injector = DI.DependencyInjector(window: window)
            injector?.build  { appCoodinator in
                self.window?.makeKeyAndVisible()
                self.window?.rootViewController = appCoodinator.navigationController
                appCoodinator.start()
            }
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}
