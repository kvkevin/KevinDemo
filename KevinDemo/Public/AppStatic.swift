//
//  UIView.swift
//  KevinDemo
//
//  Created by kevin on 2018/3/6.
//  Copyright © 2018年 kevin. All rights reserved.
//

import Foundation
import UIKit
//MARK:系统常用的一些常量   ==kevin注释==
 class AppStatic{
    static let kCurrentLanguage = "currentLanguage" //userdefatult key 当前语言
    static let ReleaseFlag = true /**<配置项目是否是发布版本*/
    static let SignCode = "SignCode"
    static let PgyerKey : String = "7d372b38d2aeb0ebed371f37951e80f7"   // 蒲公英 key

     //MARK: 发布版本和测试版本API接口根链接  ==kevin注释==
   open static var API_ROOT_PATH :String = {
        if ReleaseFlag {
            return serverIp + "/api/1.0"
        }else{
            return "http://192.168.96.128:8000/api/1.0"
        }
    }()
    
    enum ServerType {
        case beijing,singapore
    }
    //服务器
    open static var serverType : ServerType = .beijing
    //服务器ip
    open static var serverIp : String {
        switch serverType {
        case .beijing: return "http://54.223.93.205"
        case .singapore:  return "http://54.179.181.89"
        }
    }
    
    static var IMAppKey : String = {
        if ReleaseFlag
        {
          return "4ef8359c5259b5e842d9e229066b536b"
        }else{
          return "58ff9bdf0c986cc8a28ffe289da98285"
        }
    }()
    
    
    static var IMcerName : String = {
        if ReleaseFlag
        {
            return "redsipsingapore"
        }else{
            return "redsip"
        }
    }()
    

    struct Url {
        static let register = "user/register"
    }
    
    struct UserInfo {
        static let AccessToken:String = "AccessToken"
        static  let UserModel:String = "UserModel"
        static  let RedAccountModel:String = "RedAccountModel"
        static  let uid:String = "uid"
        static  let photo:String = "photo"
        static  let gender:String = "gender"
        static  let phone:String = "phone"
        static  let name:String = "name"
        static  let token:String = "token"
        static  let is_expert:String = "is_expert"
        static  let yxprofile:String = "yxprofile"


    }
    struct alertWord{
        static let failed = "requested failed"
        static let success = "success"
    }
    
    struct month {
        static  let January = "Jan"
        static  let February = "Feb"
        static  let March = "Mar"
        static  let April = "Apr"
        static  let May = "May"
        static  let June = "Jun"
        static  let July = "Jul"
        static  let August = "Aug"
        static  let September = "Sep"
        static  let October = "Oct"
        static  let November = "Nov"
        static  let December = "Dec"
    }

}
