//
//  UIView.swift
//  KevinDemo
//
//  Created by kevin on 2018/3/6.
//  Copyright © 2018年 kevin. All rights reserved.
//
import UIKit

extension UIButton {
    
    //    let ScreenWidth = UIScreen.mainScreen().bounds.width
    //    let ScreenHeight = UIScreen.mainScreen().bounds.height
    //自定义按钮：
    class func createButtonWithTitle(frame:CGRect,title:String,fontSize:CGFloat,tag:Int,target:AnyObject,action:Selector) -> UIButton  {
        let  button = UIButton.init(type: UIButton.ButtonType.custom)
        button.frame = frame
        button.setTitle(title, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        button.addTarget(target, action: action, for: UIControl.Event.touchUpInside)
        button.tag = tag
        button.setTitleColor(UIColor.black, for: .normal)
        
        return button
        
    }
    class func createButtonWithImg(frame:CGRect,imgName:String,tag:Int,target:AnyObject,action:Selector) -> UIButton  {
        let  button = UIButton.init(type: UIButton.ButtonType.custom)
        button.frame = frame
        button.setBackgroundImage(UIImage.init(named: imgName), for: UIControl.State.normal)
        button.addTarget(target, action: action, for: UIControl.Event.touchUpInside)
        button.tag = tag
        return button
        
    }
    
    
    func addTouchUpinside(target:Any?,action:Selector){
        
        self.addTarget(target, action: action, for: UIControl.Event.touchUpInside)
        
    }
    
    func showPicture(urlStr:String? , for state: UIControl.State){
        if let urlStr = urlStr , !urlStr.isEmpty{
            self.sd_setImage(with: URL.init(string: urlStr), for: state, completed: nil)
        }
        else {
            self.setImage(UIImage.init(named: "DefaultPhoto"), for: state)
        }
        
    }
    
}

