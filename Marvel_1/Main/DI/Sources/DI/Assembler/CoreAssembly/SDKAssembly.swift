//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 23/01/23.
//

import Common
import AppData
import SDK

class SDKAssembly: Assembly {
    
    func assemble(container: DIContainer) {
        
        container.register(type: AppData.FetchImageDataSource.self, component: SDK.FetchImageSDKDataSource.init())
    }
}
