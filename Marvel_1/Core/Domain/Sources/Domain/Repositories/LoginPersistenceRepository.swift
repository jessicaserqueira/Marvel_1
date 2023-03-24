//
//  File.swift
//  
//
//  Created by NMAS Amaral on 21/03/23.
//

import Foundation

public protocol LoginPersistenceRepository {
    func loginValidation(isLogged: Bool)
}
