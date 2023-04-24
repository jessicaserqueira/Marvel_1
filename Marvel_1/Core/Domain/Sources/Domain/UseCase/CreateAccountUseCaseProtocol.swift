//
//  File 2.swift
//  
//
//  Created by Jessica Serqueira on 20/04/23.
//

import Common
import Foundation
import UIKit

public protocol CreateAccountUseCaseProtocol {
    func signUp(withEmail email: String, password: String, image: UIImage, name: String, completion: @escaping (String?) -> Void)
}
