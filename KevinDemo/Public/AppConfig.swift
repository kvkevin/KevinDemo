//
//  AppConfig.swift
//  RedBot
//
//  Created by zm on 2018/3/27.
//  Copyright © 2018年 梁鑫鑫. All rights reserved.
//

import Foundation
@objc class AppConfig:NSObject{
    
    var AccessToken:String = ""     //token
    var uid:Int = 0                 //uid
    var photo:String = ""           //头像
    @objc dynamic var name:String = ""            //姓名
    var phone:String = ""           //手机号
    var gender:String = ""          //性别
    var wines:String = ""          //个人中心wine的个数
    var value:String = ""          //个人中心value的数值
    var token:String = ""          //token
    @objc dynamic var is_expert:String = ""          //is_expert
    var yxprofile:NSDictionary = ["":""]        //yxprofile
    //单例
    static let shard:AppConfig = {
        let instance  = AppConfig()
        return instance
    }()
    
    override init()
    {
        super.init()
        self.load()
    }
    
    
    func load(){
        let ud  = UserDefaults.standard
        if let accessToken = ud.object(forKey: AppStatic.UserInfo.AccessToken)
        {
            self.AccessToken = accessToken as! String
            
        }
        if let uid = ud.object(forKey: AppStatic.UserInfo.uid)
        {
            self.uid = uid as! Int
            
        }
        if let photo = ud.object(forKey: AppStatic.UserInfo.photo)
        {
            self.photo = photo as! String
            
        }
        if let gender = ud.object(forKey: AppStatic.UserInfo.gender)
        {
            self.gender = gender as! String
            
        }
        if let phone = ud.object(forKey: AppStatic.UserInfo.phone)
        {
            self.phone = phone as! String
            
        }
        if let name = ud.object(forKey: AppStatic.UserInfo.name)
        {
            self.name = name as! String
            
        }
        if let token = ud.object(forKey: AppStatic.UserInfo.token)
        {
            self.token = token as! String
            
        }
        if let is_expert = ud.object(forKey: AppStatic.UserInfo.is_expert)
        {
            self.is_expert = is_expert as! String
            
        }
        if let yxprofile = ud.object(forKey: AppStatic.UserInfo.yxprofile)
        {
            self.yxprofile = yxprofile as! NSDictionary
            
        }


        
    }
    
    //获取header
    func getHeader() -> [String:String] {
        let header = ["token":AccessToken]
        
        return header
    }
    //判断是否登录
    func isLogin() -> Bool {
        if self.AccessToken == "nil"{
            return false
        }else{
            if self.AccessToken == ""{
                return false
            }else{
                return true
            }
        }
    }
    //没token时用Uid判断是否登录
    func isLoginUid() -> Bool {
        return self.uid != 0
    }
    
    //保存
    func save(){
        let ud  = UserDefaults.standard
        ud.set(self.AccessToken, forKey: AppStatic.UserInfo.AccessToken)
        ud.set(self.uid, forKey: AppStatic.UserInfo.uid)
        ud.set(self.photo, forKey: AppStatic.UserInfo.photo)
        ud.set(self.gender, forKey: AppStatic.UserInfo.gender)
        ud.set(self.name, forKey: AppStatic.UserInfo.name)
        ud.set(self.token, forKey: AppStatic.UserInfo.token)
        ud.set(self.is_expert, forKey: AppStatic.UserInfo.is_expert)
        ud.set(self.yxprofile, forKey: AppStatic.UserInfo.yxprofile)
        ud.synchronize()
    }
    //用户退出
    func userLogOut(){
        self.AccessToken = ""
        self.uid = 0
        self.photo = ""
        self.gender =  ""
        self.name =  ""
        self.phone = ""
        self.token =  ""
        self.is_expert =  ""
        self.yxprofile =  ["":""]
        self.save()
    }
    
    
    
    
    
}
