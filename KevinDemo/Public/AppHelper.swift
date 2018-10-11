//
//  UIView.swift
//  KevinDemo
//
//  Created by kevin on 2018/3/6.
//  Copyright © 2018年 kevin. All rights reserved.
//

import Foundation
import AVFoundation
import AVKit
import Photos
import UserNotifications

@objc class AppHelper:NSObject{

//获取App版本号：
static func getAppVersion() ->String{
     return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    
   }
    // 相机权限
   static func isRightCamera() -> Bool {
    let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        return authStatus != .restricted && authStatus != .denied
    }
    // 相册权限
   static func isRightPhoto()->Bool {
    
    let library:PHAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
    if (library == PHAuthorizationStatus.authorized){
        return true
    } else {
        return false
    }    }
    
    //消息通知权限    ///待优化
    static func isAccepteNotification() ->Bool{
        var isAccepteNotification =  false
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { (accepted, error) in
            if accepted{
                isAccepteNotification =  true
            }
            else{
                isAccepteNotification =  false
            }
        }
        return isAccepteNotification
    }
    //获取用户的UUID   ///待优化
    static func getUUID() ->String {
        let uuid  =  UIDevice.current.identifierForVendor?.uuidString
        return String(describing: uuid)
    }
}
