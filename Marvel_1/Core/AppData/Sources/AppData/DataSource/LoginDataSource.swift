//
//  File.swift
//  
//
//  Created by NMAS Amaral on 22/03/23.
//

import Foundation

public protocol LoginDataSource: AnyObject {
    func loginAuthentication(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void)
}
