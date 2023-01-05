//
//  LoginManager.swift
//  KarooooDemo
//
//  Created by Muzaffar on 02/01/23.
//

import Foundation

struct LoginManager {
    
    private let loginRepo = LoginRepositoryFile()
    
    func createloginSQ(login: Login) {
        loginRepo.createLoginSQ(login: login)
    }
    
    func validateUserLogin(login: Login) -> Bool {
        return loginRepo.validateUserLogin(login: login)
    }
     
    func createUserLogin(username: String, password: String, country: String) -> Login {
        let login = Login(username: username, password: password, country: country)
        return login
    }
    
    func createFakeUser() -> Login {
        
        let login = Login(username: CTConstans.fakeUserEmail, password: CTConstans.fakeUserPassword, country: CTConstans.fakeUserCountry)
        return login
    }
}
