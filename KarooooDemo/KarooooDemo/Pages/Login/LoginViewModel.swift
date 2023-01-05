//
//  LoginViewModel.swift
//  KarooooDemo
//
//  Created by Muzaffar on 02/01/23.
//

import Foundation


class LoginViewModel {
    
    var loginManager: LoginManager
    
    init() {
        loginManager = LoginManager()
    }
    
    func validateUserLogin(login: Login) -> Bool{
        
        return loginManager.validateUserLogin(login: login)
    }
    
    func signup(signup: Login) -> Bool{
        
        loginManager.createloginSQ(login: signup)
        return true
    }
    
    
    func checkForEmail(email: String?) -> Bool{
        if let email = email{
            if Utility.validateEmail(email: email){
                return true
            }
        }
        return false
    }
    
    func checkForPassword(password: String?) -> Bool {
        if let password = password{
            if password.count >= 8{
                return true
            }
        }
        return false
    }
    
    func checkForCountry(country: String?) -> Bool{
        if country == nil{
            return false
        }
        return true
    }
}
