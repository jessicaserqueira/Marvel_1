//
//  File.swift
//  
//
//  Created by NMAS Amaral on 16/12/22.
//

import Foundation

public protocol DIContainerProtocol {
    func register<Component>(type: Component.Type, component: Any)
    func resolve<Component>(type: Component.Type) -> Component?
}

public final class DIContainer: DIContainerProtocol {
    public static let shared = DIContainer()
    
    public init() {}
    
    public var components: [String: Any] = [:]
    
    public func register<Component>(type: Component.Type, component: Any) {
        components["\(type)"] = component
    }
    
    public func resolve<Component>(type: Component.Type) -> Component? {
        return components["\(type)"] as? Component
    }
}

