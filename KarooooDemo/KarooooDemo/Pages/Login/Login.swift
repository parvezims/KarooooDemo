//
//  Login.swift
//  KarooooDemo
//
//  Created by Muzaffar on 02/01/23.
//

import Foundation

struct Login : Identifiable{
    
    var username: String
    var password: String
    var country: String
    var id: String = UUID().uuidString
    var date: String = Date().toString()
}

extension Login {
    func convertToLoginSQ() -> LoginSQ {
        LoginSQ(username: self.username, password: self.password, country:self.country, id: self.id, date: self.date)
    }
}
