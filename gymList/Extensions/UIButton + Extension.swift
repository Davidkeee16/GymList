//
//  UIButton + Extension.swift
//  gymList
//
//  Created by David Puksanskis on 16/07/2025.
//


import UIKit

extension UIButton {
    
    convenience init(text: String) {
        self.init(type: .system)
        
        self.setTitle(text, for: .normal)
    }
    
    
}
