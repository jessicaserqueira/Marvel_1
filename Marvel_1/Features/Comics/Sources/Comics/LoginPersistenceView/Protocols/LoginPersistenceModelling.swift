//
//  File.swift
//  
//
//  Created by NMAS Amaral on 20/03/23.
//

import Foundation
import SwiftUI

@MainActor
public protocol LoginPersistenceModelling: ObservableObject {
    
    func onAppear()
    func logout()
}
