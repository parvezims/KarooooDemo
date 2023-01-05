//
//  User.swift
//  KarooooDemo
//
//  Created by Muzaffar on 04/01/23.
//

import Foundation

struct User: Decodable {
    
    var id: Int
    var name: String
    var username: String
    var email: String
    var phone: String
    var website: String
    var address: Address
    var company: Company
}

struct Address: Decodable {
    
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geo: GeoCodes
}

struct Company: Decodable {
    
    var name:String
    var catchPhrase: String
    var bs: String
}

struct GeoCodes:Decodable {
    
    var lat: String
    var lng: String
}
