//
//  DatabaseManager.swift
//  KarooooDemo
//
//  Created by Muzaffar on 02/01/23.
//

import Foundation
import SQLite3



class DatabaseManager {
    
    private let dbPath: String = "cartrack.sqlite"
    var db:OpaquePointer?
    
    static let shared = DatabaseManager()
    private init() {
        db = openDatabase()
    }
    
    func openDatabase() -> OpaquePointer? {
        
        let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(dbPath)
        var db: OpaquePointer? = nil
        print(filePath)
        if sqlite3_open(filePath.path, &db) != SQLITE_OK
        {
            debugPrint("can't open database")
            return nil
        }
        else
        {
            print("Successfully created connection to database at \(dbPath)")
            return db
        }
        
    }
    
    func closeDatabase() {
        sqlite3_close(db)
    }
}

