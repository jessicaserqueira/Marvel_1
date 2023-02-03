//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 02/02/23.
//

import UIKit
import SwiftUI

public class CharacterHomeViewController: UIViewController {
    
    private let viewModel: CharacterHomeModelling?
    
    public init(viewModel: CharacterHomeModelling?) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = nil
        super.init(coder: coder)
    }
}

extension CharacterHomeViewController: CharacterViewable {
    public func show(message: String) {
        print(message)
    }
    
    public func showLoading() {
        
    }
    
    public func hideLoading() {
        
    }
}
