//
//  File.swift
//  
//
//  Created by NMAS Amaral on 16/12/22.
//

import Common
import Storage
import AppData

class StorageAssembly: Assembly {
    
    func assemble(container: DIContainer) {
        
        container.register(type: AppData.ComicsLocalDataSource.self, component: Storage.ComicsLocalDataSource.init())
    }
}
