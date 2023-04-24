//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 04/04/23.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
