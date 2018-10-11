//
//  UIView.swift
//  KevinDemo
//
//  Created by kevin on 2018/3/6.
//  Copyright © 2018年 kevin. All rights reserved.
//
import UIKit

//MARK: 颜色扩展  ==kevin注释==
extension UIColor{
    //十六进制颜色  带透明度
    static func colorWithHex(hexValue:Int,alphaValue:CGFloat)->UIColor{
        if hexValue > 0xFFF
        {
            return UIColor(red: CGFloat((hexValue & 0xFF0000) >> 16) / 255.0, green: CGFloat((hexValue & 0xFF00) >> 8) / 255.0, blue: CGFloat(hexValue & 0xFF)  / 255.0, alpha: alphaValue)
        }else
        {
            return UIColor(red: CGFloat((hexValue & 0xF00) >> 8) / 255.0, green: CGFloat((hexValue & 0xF0) >> 4) / 255.0, blue: CGFloat(hexValue & 0xF)  / 255.0, alpha: alphaValue)
        }
    }
    
    //十六进制不带透明度
    static func colorWithHex(hexValue:Int)->UIColor{
        return UIColor.colorWithHex(hexValue: hexValue, alphaValue: 1)
    }
    //生成随机色
    static  func randomColor()->UIColor{
        let r = CGFloat(arc4random()%255)
        let g = CGFloat(arc4random()%255)
        let b = CGFloat(arc4random()%255)
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
    
    }
    //RGB颜色
    static func colorWithRGB(r:CGFloat, g:CGFloat, b:CGFloat, alpha:CGFloat = 1) -> UIColor
    {
        return UIColor(red: r / 255.0, green: g / 255.0 , blue: b / 255.0, alpha: alpha)
    }
    //一些常用的系统颜色
    static var mainColor = UIColor.colorWithHex(hexValue: 0x259308)
    static var mainBorderColor = UIColor .colorWithHex(hexValue: 0xAEB7C8)
    static var mainBackGroundColor = UIColor.colorWithRGB(r: 248, g:248, b: 248)
    static var mainTextColot = UIColor.colorWithHex(hexValue: 0x777777)
    static var mainRedColor = UIColor.colorWithHex(hexValue: 0xFA5C5C)
    static var mainMaskColor = UIColor.colorWithRGB(r: 0, g: 0, b: 0, alpha: 0.5)
}
