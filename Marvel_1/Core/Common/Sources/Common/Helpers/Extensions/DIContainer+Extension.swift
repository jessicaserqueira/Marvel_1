//
//  File.swift
//  
//
//  Created by NMAS Amaral on 16/12/22.
//

import Foundation

extension DIContainer {

    public func resolveSafe<Service>(_ serviceType: Service.Type) -> Service {
        guard let dependency = resolve(type: serviceType) else {
            preconditionFailure("\(serviceType) is nil")
        }
        return dependency
    }
}
