//
//  Date+Extension.swift
//  KarooooDemo
//
//  Created by Muzaffar on 03/01/23.
//

import Foundation


extension Date {
    
    func toString() -> String {        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = CTConstans.dateFormat
        return dateFormatter.string(from: self)
    }
}

