//
//  Storyboard.swift
//  KarooooDemo
//
//  Created by Muzaffar on 02/01/23.
//

import Foundation
import UIKit

protocol Storyboard {
    static func instantiate() -> Self
}

extension Storyboard where Self : UIViewController {
    
    static func instantiate() -> Self {
        
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
