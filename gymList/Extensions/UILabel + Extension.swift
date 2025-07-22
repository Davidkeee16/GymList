//
//  UILabel + Extension.swift
//  gymList
//
//  Created by David Puksanskis on 16/07/2025.
//



import UIKit


extension UILabel {
    convenience init(text: String, size: CGFloat = 40) {
        self.init()
        
        self.text = text
        self.font = UIFont.systemFont(ofSize: size)
        
        
        
    }
}


