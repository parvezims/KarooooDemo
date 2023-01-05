//
//  LoginRepositoryFile.swift
//  KarooooDemo
//
//  Created by Muzaffar on 02/01/23.
//

import Foundation


protocol LoginRepository {
    
    func createLoginSQ(login: Login)
    func validateUserLogin(login: Login) -> Bool
}

struct LoginRepositoryFile : LoginRepository {
    
    let loginTableManager = LoginTableManager(database: DatabaseManager.shared.db!)
    
    func createLoginSQ(login: Login) {

        loginTableManager.insert(login: login.convertToLoginSQ())
    }
    
    func validateUserLogin(login: Login) -> Bool {
        return loginTableManager.validateUserLogin(login: login.convertToLoginSQ())
    }
    
}
