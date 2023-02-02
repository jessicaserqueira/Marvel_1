//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 02/02/23.
//

import Foundation

public protocol ViewLoadable: AnyObject {

    func showLoading()
    func hideLoading()
}
