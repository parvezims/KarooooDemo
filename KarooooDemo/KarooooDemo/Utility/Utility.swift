//
//  Utility.swift
//  KarooooDemo
//
//  Created by Muzaffar on 05/01/23.
//

import Foundation


class Utility{
    
    static func validateEmail(email: String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
