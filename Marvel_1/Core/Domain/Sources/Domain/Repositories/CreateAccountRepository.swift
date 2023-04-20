//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 20/04/23.
//

import Foundation
import UIKit


public protocol CreateAccountRepository {
    
    func signUp(withEmail email: String, password: String, image: UIImage, name: String, completion: @escaping (String?) -> Void)
}
