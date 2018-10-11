//
//  UIView.swift
//  KevinDemo
//
//  Created by kevin on 2018/3/6.
//  Copyright © 2018年 kevin. All rights reserved.
//

import Foundation
import UIKit

//MARK: UILable扩展  ==kevin注释==
extension UILabel {
   //修改UILabel中的部分字的颜色
    func changeColor(string:String,color:UIColor){
        let text = self.text!
        let attributedString = NSMutableAttributedString(string: text)
        let range = attributedString.string.range(of:string)
        let nsrange = attributedString.string.nsRange(from: range!)
        attributedString.addAttribute(.foregroundColor, value:color, range: nsrange!)
        self.attributedText = attributedString
    }
}
