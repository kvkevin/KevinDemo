//
//  UIView.swift
//  KevinDemo
//
//  Created by kevin on 2018/3/6.
//  Copyright © 2018年 kevin. All rights reserved.
//

import Foundation
import FMDB
import SQLite3
class DBHelper{
    var path:String! ;
    var queue:FMDatabaseQueue!;
    
    init(){
        let manager = FileManager.default;
        let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).last;
        self.path = cachePath! + "/Redbot.db"
        print(self.path)
        if !manager.fileExists(atPath: self.path){
            try! manager.copyItem(atPath: Bundle.main.path(forResource: "Redbot.db", ofType: nil)!, toPath: self.path);
        }
        
        queue=FMDatabaseQueue(path: path)
    }
    private static var single = DBHelper();
    static func sharedInstance() ->DBHelper{
        return self.single;
        
    }
    static func refreshDatabase() ->DBHelper{
        let instance = self.sharedInstance();
        instance.doRefresh();
        return instance;
    }
    private func doRefresh(){
        
        queue = FMDatabaseQueue(path: path);
        
    }
    func inDatabase(block:@escaping (FMDatabase?)->Void){
        queue.inDatabase(block);
    }
    func close(){
        queue.close();
    }
    

}

