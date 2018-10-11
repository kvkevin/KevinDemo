//
//  UIView.swift
//  KevinDemo
//
//  Created by kevin on 2018/3/6.
//  Copyright © 2018年 kevin. All rights reserved.
//

import Foundation
import UIKit
//MARK: UITextField扩展  ==kevin注释==
extension UITextField{
    //加圆角
    func CornerRadius(radius:CGFloat){
        
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    //加边框
    func AddBorder(width:CGFloat){
        
        self.layer.borderWidth = width
    }
    //边框颜色
    func AddBorderColor(color:UIColor){
        self.layer.borderColor = color.cgColor
        
    }

}
