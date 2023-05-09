//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 05/05/23.
//

import Swinject

public protocol DependencyFactory: AnyObject {

    init(container: Resolver)
}
