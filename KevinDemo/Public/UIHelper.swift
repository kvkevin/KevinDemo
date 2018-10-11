//
//  UIView.swift
//  KevinDemo
//
//  Created by kevin on 2018/3/6.
//  Copyright © 2018年 kevin. All rights reserved.
//
import Foundation
import UIKit
//屏幕宽度
public let SCREENW = UIScreen.main.bounds.size.width
//屏幕高度
public let SCREENH = UIScreen.main.bounds.size.height
//主window
public let MainWindow = UIApplication.shared.delegate!.window!!
//缩放  根据屏幕宽度缩放 设计以375为标准  对应 iphone8，iphoneX 屏幕宽度
public let SCALE : CGFloat = SCREENW/375.0
//故事版枚举
enum StoryboardCategory:String{
    case Main = "Main"
    case kevin = "Main-Kevin"
    case group = "Main-Group"
}
//MARK: UI帮助类  ==kevin注释==
class UIHelper {
    //系统主色调
    static let mainColor:UIColor = UIColor.red
    //系统主字体
    static let mainFont:UIFont! =  UIFont(name: "NotoSansHans-Light", size: 10.0)
    //navigation字体
    static let mainFont10:UIFont! = UIFont(name: "NotoSansHans-Light", size: 10)
    static let mainFont11:UIFont! = UIFont(name: "NotoSansHans-Light", size: 11)
    static let mainFont12:UIFont! = UIFont(name: "NotoSansHans-Light", size: 12)
    static let mainFont13:UIFont! = UIFont(name: "NotoSansHans-Light", size: 13)
    static let mainFont14:UIFont! = UIFont(name: "NotoSansHans-Light", size: 14)
    static let mainFont17:UIFont! = UIFont(name: "NotoSansHans-Light", size: 17)
    static let mainNaviFont22:UIFont! = UIFont(name: "NotoSansHans-Light", size: 22)
    //列表边框，下划线的颜色
    static var layBordeColor:CGColor! = UIColor.gray.cgColor.copy(alpha: 0.3)
    
    //图片存储
    static func ARSavePicture(img:UIImage,date:String,tag:String){
        print("date is\(date),tag is \(tag)")
        //文件操作函数
    }
    static func ARSavePicture(img:Data,date:String,tag:String){
        print("date is\(date),tag is \(tag)")
        //文件操作函数
        }
    //选择VC
    static func GetVCWithIDFromStoryBoard(sc:StoryboardCategory, viewControllerIdentity:String) -> UIViewController {
        let storyboard = UIStoryboard(name: sc.rawValue, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: viewControllerIdentity)
        return vc
    }
    
    
}
