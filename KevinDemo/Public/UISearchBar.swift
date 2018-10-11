//
//  UISearchBar.swift
//  KevinDemo
//
//  Created by zm on 2018/9/26.
//  Copyright © 2018年 zm. All rights reserved.
//

import Foundation
import UIKit

 //MARK: UISearchBar扩展  ==kevin注释==
extension UISearchBar {
    var textField: UITextField? {
        let subViews = subviews.flatMap { $0.subviews }
        guard let textField = (subViews.filter { $0 is UITextField }).first as? UITextField else {
            return nil
        }
        return textField
    }
    func clear() {
        text = ""
    }
    func showDefaultStyle() {
        tintColor = UIColor.mainColor
        barStyle = .default
        barTintColor = UIColor.white
        backgroundImage = UIImage.init()
        textField?.makeCornerRadius(radius: 5*SCALE)
        textField?.border(width: 1)
        textField?.borderColor(color: UIColor.mainBorderColor)
        placeholder = "Search here...".localized
    }
}
