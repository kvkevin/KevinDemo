//
//  UIView.swift
//  KevinDemo
//
//  Created by kevin on 2018/3/6.
//  Copyright © 2018年 kevin. All rights reserved.
//
import Foundation
import Alamofire

//MARK: 网络请求  ==kevin注释==
struct DemonNet {
    static func httpPost(apiname: String ,
                         descrption:String = "",
                         body: Any?,
                         showHUD: Bool = true,
                         failure: ((Int , String)->Void)? = nil,
                         success: ((AnyObject)->Void)?) {
        if showHUD {
//            DemonAlertHelper.showRequestingView()
        }
        
        let url = apiname.hasPrefix("http") ? apiname : AppStatic.API_ROOT_PATH + apiname
        
        
        var myRequest = URLRequest(url: try! url.asURL())
        myRequest.httpMethod = "POST"
       // myRequest.allHTTPHeaderFields = AppHelper.get()
        if myRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            myRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        
      //  myRequest.setValue("Token \(UserTool.shard.accessToken)", forHTTPHeaderField: "Authorizationr")
        if let body = body {
            myRequest.httpBody = try! JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        
        request(myRequest).response { (dataResponse) in
            if showHUD {
//                DemonAlertHelper.dissmissRequestView()
            }
            
            if dataResponse.error == nil {
                
                if let dataDir = try? JSONSerialization.jsonObject(with: dataResponse.data!, options: JSONSerialization.ReadingOptions.allowFragments) as? NSDictionary{
                   
                            //系统错误
                            if failure != nil {
                                let code = dataDir?.object(forKey: "code")  as! Int
                                let message = dataDir?.object(forKey: "code")  as? String ?? ""
                                
                                self.requestDataFailed(error: "", failure: failure!, data: (code, message))
                            }else {
                                let str = ((dataDir?.object(forKey: "data") as? NSDictionary ?? NSDictionary()).object(forKey:"message"))  ?? "网络内容返回出错"
                                self.requestDataFailed(error: str as! String)
                            }
                            
                    
                }else {
                    self.requestDataFailed(error: "请求返回错误")
                }
                
            }else {
                self.requestDataFailed(error: "网络错误")
            }
            
        }
    }
    
    
    
    
    
    static func httpGet(apiname: String , descrption:String = "", body: [String:Any]?, showHUD: Bool = true,  failure: ((Int, String)->Void)? = nil,  success: ((AnyObject)->Void)?) {
        if showHUD {
//            DemonAlertHelper.showRequestingView()
        }
        
        let url = apiname.hasPrefix("http") ? apiname : AppStatic.API_ROOT_PATH + apiname
        
        request(url, method: .get, parameters: body, encoding: URLEncoding.default  , headers:nil).response { (dataResponse) in
            if showHUD {
                //DemonAlertHelper.dissmissRequestView()
            }
            
            
            if let statusCode = dataResponse.response?.statusCode {
                if statusCode == 401 {
                    //退出登录
//                    if !UserTool.shard.isUserLogin() {
//                        return
//                    }
//                    UserTool.shard.userLogout()
                    
                }
            }
            
            
            
            if dataResponse.error == nil {
                
                if let dataDir = try? JSONSerialization.jsonObject(with: dataResponse.data!, options: JSONSerialization.ReadingOptions.allowFragments) as? NSDictionary{
                    if let type = dataDir?.object(forKey: "type") as? String {
                        if type == "systemMessage" {
                            //系统错误
                            if failure != nil {
                                let code = ((dataDir?.object(forKey: "data") as? NSDictionary ?? NSDictionary()).object(forKey:"code"))  as! Int
                                let message = ((dataDir?.object(forKey: "data") as? NSDictionary ?? NSDictionary()).object(forKey:"message"))  as! String
                                
                                
                                
                                
                                
                                self.requestDataFailed(error: "", failure: failure!, data: (code, message))
                            }else {
                                let str = ((dataDir?.object(forKey: "data") as? NSDictionary ?? NSDictionary()).object(forKey:"message"))  ?? "网络内容返回出错"
                                self.requestDataFailed(error: str as! String)
                            }
                            
                        }else {
                            success?(dataDir?.object(forKey: "data") as AnyObject)
                        }
                    }else {
                        self.requestDataFailed(error: "请求返回错误")
                    }
                }else {
                    self.requestDataFailed(error: "请求返回错误")
                }
                
            }else {
                self.requestDataFailed(error: "网络错误")
            }
            
        }
    }
    
    
    
    
    
    
    static func handleResponse()
    {
        
    }
    
    
    
    /**
     网络请求失败
     
     - parameter error: 失败描述
     */
    static func requestDataFailed(error:String, failure: ((Int, String)->Void)? = nil, data: (Int, String)? = nil)
    {
        if failure == nil
        {
            if error.characters.count > 0 {
               // DemonAlertHelper.showToastWithMessage(message: error)
            }
        }else
        {
            if let data = data {
                failure?(data.0, data.1)
            }
        }
        
    }
    
    
    
    
    
    
    
    
}

