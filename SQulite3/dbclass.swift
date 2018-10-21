//
//  dbclass.swift
//  SQulite3
//
//  Created by mac on 27/07/18.
//  Copyright © 2018 jeky. All rights reserved.
//

import UIKit

class dbclass: NSObject
{
    
    func dml(query:String)->Bool
    {
        var status :Bool = true
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let fullpath = path[0]
        let finalpath = fullpath.appending("/jeky.db")
        
        var dbname:OpaquePointer? = nil
        
        if sqlite3_open(finalpath, &dbname) == SQLITE_OK
        {
            var stmat : OpaquePointer? = nil
            
            if sqlite3_prepare(dbname, query, -1, &stmat, nil) == SQLITE_OK
            {
                sqlite3_step(stmat)
                status = true
            }
            sqlite3_finalize(stmat)
        }
        sqlite3_close(dbname)
        return status
    }

    func getData(query:String) -> [Any]
    {
        var arr : [Any] = []
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let fullpath = path[0]
        let finalpath = fullpath.appending("/jeky.db")
        
        var dbname:OpaquePointer? = nil
        
        if sqlite3_open(finalpath, &dbname) == SQLITE_OK
        {
            var stmat : OpaquePointer? = nil
            
            
            if sqlite3_prepare(dbname, query, -1, &stmat, nil) == SQLITE_OK
            {
                while sqlite3_step(stmat) == SQLITE_ROW
                {
                    var brr : [Any] = []
                    
                    let emp_id = String(cString: sqlite3_column_text(stmat, 0))
                    let emp_name = String(cString: sqlite3_column_text(stmat, 1))
                    let emp_add = String(cString: sqlite3_column_text(stmat, 2))
                    
                    brr.append(emp_id)
                    brr.append(emp_name)
                    brr.append(emp_add)
                    
                    arr.append(brr)
                }
            }
            sqlite3_finalize(stmat)
        }
        sqlite3_close(dbname)
        return arr
    }
}
