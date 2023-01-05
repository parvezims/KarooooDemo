//
//  UIViewController+Extension.swift
//  KarooooDemo
//
//  Created by Muzaffar on 04/01/23.
//

import Foundation
import UIKit


extension UIViewController {
    
    func showAlert(title: String, message: String, okTitle: String) {
        
        let alert = UIAlertController(title:title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title:okTitle, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
