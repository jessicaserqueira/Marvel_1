//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 23/01/23.
//

import Common
import AppData
import SDK
import Swinject

class SDKAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.autoregister(AppData.FetchImageDataSource.self, initializer: SDK.FetchImageSDKDataSource.init)
    }
}
