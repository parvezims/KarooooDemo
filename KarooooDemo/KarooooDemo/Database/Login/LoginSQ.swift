//
//  LoginSQ.swift
//  KarooooDemo
//
//  Created by Muzaffar on 02/01/23.
//

import Foundation

class LoginSQ {

    var username: String
    var password: String
    var country: String
    var id: String
    var date: String
    
    init(username:String, password:String, country: String, id: String, date:String )
    {
        self.username = username
        self.password = password
        self.id = id
        self.date = date
        self.country = country
    }
}

extension LoginSQ : Identifiable {
    
    func convertToLogin() -> Login {
        Login(username: self.username, password: self.password,country:self.country, id: self.id, date: self.date)
    }
}

