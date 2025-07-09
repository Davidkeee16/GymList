//
//  UIView + Extension.swift
//  gymList
//
//  Created by David Puksanskis on 08/07/2025.
//

import Foundation
import UIKit


extension UIView {
    
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
 }
