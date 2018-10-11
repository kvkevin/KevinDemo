//
//  UIImageView.swift
//  KevinDemo
//
//  Created by zm on 2018/9/26.
//  Copyright © 2018年 zm. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
//MARK: 缺省图枚举  ==kevin注释==
    enum DefaultPicture:String {
        case DefaultPhoto = "DefaultPhoto"
        case GroupsDefault = "GroupsDefault"
        case MeetupsDefault = "MeetupsDefault"
        case ImageFailed = "ImageFailed"
        case IMwating = "IMwating"
        case profleDefaultPhoto = "profleDefaultPhoto"
    }
//MARK: UIImageView扩展  ==kevin注释==
  extension UIImageView{
        func showPicture(url:String,placeholder:DefaultPicture = .DefaultPhoto){
            self.sd_setImage(with:URL(string:url), placeholderImage:UIImage(named:placeholder.rawValue), completed: nil)
        }
}
