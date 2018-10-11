//
//  UIView.swift
//  KevinDemo
//
//  Created by kevin on 2018/3/6.
//  Copyright © 2018年 kevin. All rights reserved.
//

import Foundation
import UIKit

fileprivate let itemFlag: Int = 666

extension UITabBar {
    // MARK:- 显示小红点
    func showBadgOn(index itemIndex: Int, tabbarItemNums: Int = 5) {
        // 移除之前的小红点
        self.removeBadgeOn(index: itemIndex)
        
        // 创建小红点
        let bageView = UIView()
        bageView.tag = itemIndex + itemFlag
        bageView.layer.cornerRadius = 3
        bageView.backgroundColor = UIColor.mainRedColor
        let tabFrame = self.frame
        
        // 确定小红点的位置
        let percentX: CGFloat = (CGFloat(itemIndex) + 0.59) / CGFloat(tabbarItemNums)
        let x: CGFloat = CGFloat(ceilf(Float(percentX * tabFrame.size.width)))
        let y: CGFloat = CGFloat(ceilf(Float(0.115 * tabFrame.size.height)))
        bageView.frame = CGRect(x: x, y: y, width: 6, height: 6)
        let iteWidth = tabFrame.size.width / CGFloat(tabbarItemNums)
        bageView.center = CGPoint(x: CGFloat(itemIndex) * iteWidth + iteWidth/2 , y: 5)
        self.addSubview(bageView)
    }
    
    // MARK:- 隐藏小红点
    func hideBadg(on itemIndex: Int) {
        // 移除小红点
        self.removeBadgeOn(index: itemIndex)
    }
    
    // MARK:- 移除小红点
    fileprivate func removeBadgeOn(index itemIndex: Int) {
        // 按照tag值进行移除
        _ = subviews.map {
            if $0.tag == itemIndex + itemFlag {
                $0.removeFromSuperview()
            }
        }
    }
}
