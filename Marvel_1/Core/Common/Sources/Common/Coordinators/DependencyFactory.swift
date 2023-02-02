//
//  File.swift
//  
//
//  Created by NMAS Amaral on 22/12/22.
//

import Foundation

public protocol DependencyFactory: AnyObject {

    init(container: DIContainer)
}
