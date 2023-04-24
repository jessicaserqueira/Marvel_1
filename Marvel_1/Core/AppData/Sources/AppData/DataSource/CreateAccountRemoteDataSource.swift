//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 20/04/23.
//

import Common
import Foundation
import UIKit

public protocol CreateAccountRemoteDataSource: AnyObject {
    var formInvalid: Bool { get set }
    var alertText: String { get set }
    
    func signUp(withEmail email: String, password: String, image: UIImage, name: String, completion: @escaping (String?) -> Void)
}
