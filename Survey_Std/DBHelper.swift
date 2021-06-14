//
//  DBHelper.swift
//  SQLiteExample
//
//  Created by User on 2021/05/25.
//

import Foundation
import SQLite3

class DBHelper {
    var db: OpaquePointer? // &db : Swift에서는 표현 불가능한 C 포인터를 표현할 때 사용
    var path: String = "myDb.sqlite"
    
    init() {
        self.db = createDB()
        self.createTable()
    }
    
    private func createDB() -> OpaquePointer? {
        do {
            let filePath = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathExtension(path)

            var db: OpaquePointer? = nil
            
            if sqlite3_open(filePath.path, &db) != SQLITE_OK {
                print("There is error in creating DB")
                return nil
            }
            
            print("Database is been created with path \(path)")
            return db
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    private func createTable() -> Void {
        let query = "CREATE TABLE IF NOT EXISTS user(id VARCHAR(50), pw VARCHAR(30));"
        
        var statement: OpaquePointer? = nil
        
        // -1 : 음수일 경우 \0 문자(문자열의 끝)가 나올때까지 읽는다는 의미
        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Table creation success")
            } else {
                print("Table creation fail")
            }
        } else {
            print("Prepration fail")
        }
        
        // statement 객체를 안전하게 종료
        sqlite3_finalize(statement)
    }
    
    func insert(queryString: String, id: NSString, pw: NSString) {
        var insertStatement: OpaquePointer? = nil

        if sqlite3_prepare_v2(db, queryString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, id.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, pw.utf8String, -1, nil)

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
    
    func update(queryString: String) {
        var updateStatement: OpaquePointer? = nil

        if sqlite3_prepare_v2(db, queryString, -1, &updateStatement, nil) == SQLITE_OK {
            if sqlite3_step(updateStatement) == SQLITE_DONE {
                print("Successfully updated row.")
            } else {
                print("Could not updated row.")
            }
        } else {
            print("UPDATE statement could not be prepared.")
        }

        sqlite3_finalize(updateStatement)
    }
    
    func delete(queryString: String = "DROP TABLE user") {
        var deleteStatment: OpaquePointer? = nil

        if sqlite3_prepare_v2(db, queryString, -1, &deleteStatment, nil) == SQLITE_OK {
            if sqlite3_step(deleteStatment) == SQLITE_DONE {
                print("Successfully deleted row.")
            } else {
                print("Could not deleted row.")
            }
        } else {
            print("DELETE statement could not be prepared.")
        }

        sqlite3_finalize(deleteStatment)
    }
    
    func query(queryString: String) {
        var queryStatement: OpaquePointer? = nil

        if sqlite3_prepare_v2(db, queryString, -1, &queryStatement, nil) == SQLITE_OK {
            if sqlite3_step(queryStatement) == SQLITE_ROW {
                guard let queryResultCol1 = sqlite3_column_text(queryStatement, 0) else {
                    print("Query result is nil")
                    return
                }

                let id = String(cString: queryResultCol1)

                guard let queryResultCol2 = sqlite3_column_text(queryStatement, 1) else {
                    print("Query result is nil")
                    return
                }

                let pw = String(cString: queryResultCol2)
                
                print("\nQuery Result:")
                print("\(id) | \(pw)")
            } else {
                print("\nQuery returned no results.")
            }
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(db))
            print("\nQuery is not prepared \(errorMessage)")
        }

        sqlite3_finalize(queryStatement)
    }
}
