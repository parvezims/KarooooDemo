//
//  LoginTableManager.swift
//  KarooooDemo
//
//  Created by Muzaffar on 02/01/23.
//

import Foundation
import SQLite3

class LoginTableManager {
    
    private var db:OpaquePointer?
    
    init(database: OpaquePointer ) {
        self.db = database
        createLoginTable()
    }
    
    private func createLoginTable() {
        
        let createTableString = "CREATE TABLE IF NOT EXISTS Login(uuid TEXT PRIMARY KEY,username TEXT,password TEXT, country TEXT, date TEXT);"
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) == SQLITE_DONE
            {
                print("Login table created.")
            } else {
                print("Login table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
        
    func insert(login: LoginSQ)
    {
        let logins = read()
        for p in logins
        {
            if p.username == login.username
            {
                return
            }
        }
        
        let insertStatementString = "INSERT INTO Login(uuid, username, password, country, date) VALUES (?, ?, ?, ?, ?);"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, (login.id as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (login.username as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (login.password as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, (login.country as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 5, (login.date as NSString).utf8String, -1, nil)

            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    func read() -> [LoginSQ] {
        
        let queryStatementString = "SELECT * FROM Login;"
        var queryStatement: OpaquePointer? = nil
        var login : [LoginSQ] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                
                let id = String(describing: String(cString: sqlite3_column_text(queryStatement, 0)))
                let username = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let password = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let country = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                let date = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
                login.append(LoginSQ(username: username, password: password, country: country, id: id, date: date))
                print("Query Result:")
                print("\(id) | \(username)")
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return login
    }
    
    func validateUserLogin(login: LoginSQ) -> Bool {
        
        let logins = read()
        for detail in logins
        {
            if detail.username == login.username && detail.password == login.password && detail.country == login.country
            {
                return true
            }
        }
        return false
    }
}

