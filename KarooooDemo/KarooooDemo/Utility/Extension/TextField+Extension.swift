//
//  TextField+Extension.swift
//  KarooooDemo
//
//  Created by Muzaffar on 05/01/23.
//

import Foundation
import UIKit
import Combine

extension UITextField {

    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default.publisher(
            for: UITextField.textDidChangeNotification,
            object: self
        )
        .compactMap { ($0.object as? UITextField)?.text }
        .eraseToAnyPublisher()
    }
    
    
    func showErrorData() {
        
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 2.5
        self.layer.borderColor = UIColor.red.cgColor
    }
    
    func showCompleteData() {
        
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor(named:CTConstans.brandColor)?.cgColor
    }

    func shakeAnimation(status : Bool) {
        
        if status == false {
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.07
            animation.repeatCount = 4
            animation.autoreverses = true
            animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
            animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
            self.layer.add(animation, forKey: "position")
        }
    }
    
}
