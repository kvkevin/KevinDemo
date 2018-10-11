//
//  UIView.swift
//  KevinDemo
//
//  Created by kevin on 2018/3/6.
//  Copyright © 2018年 kevin. All rights reserved.
//

import UIKit


typealias STBarButtonItemBlock = () -> ()

class STBarButtonItemWrapper {
    var block: STBarButtonItemBlock?
    init(block: @escaping STBarButtonItemBlock) {
        self.block = block
    }
}

struct STConst {
    static var STBarButtonItemWrapperKey = "STBarButtonItemWrapperKey"
}

extension UIBarButtonItem {
    convenience init(title: String?, style: UIBarButtonItem.Style, block: @escaping STBarButtonItemBlock) {
        self.init()
        self.title = title
        self.style = style
        self.target = self
        action = #selector(UIBarButtonItem.buttonTapped)
        let wrapper = STBarButtonItemWrapper(block: block)
        objc_setAssociatedObject(self, &STConst.STBarButtonItemWrapperKey, wrapper, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    
    //    convenience init(title: String?, style: UIBarButtonItemStyle, target : AnyObject? ,block: STBarButtonItemBlock) {
    //        self.init()
    //        self.title = title
    //        self.style = style
    //        self.target = target
    //        action = #selector(UIBarButtonItem.buttonTapped)
    //        let wrapper = STBarButtonItemWrapper(block: block)
    //        objc_setAssociatedObject(self, &STConst.STBarButtonItemWrapperKey, wrapper, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    //    }
    
    //  UIBarButtonItem(image: UIImage(named:strNname), style: UIBarButtonItemStyle.Plain, target: targetVC, action: doAction)
    
    
    
    
    convenience init(image: UIImage?, style: UIBarButtonItem.Style, block: @escaping STBarButtonItemBlock) {
        self.init()
        // self.title = title
        self.image = image
        self.style = style
        self.target = self
        action = #selector(UIBarButtonItem.buttonTapped)
        let wrapper = STBarButtonItemWrapper(block: block)
        objc_setAssociatedObject(self, &STConst.STBarButtonItemWrapperKey, wrapper, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    
    //    convenience init(image: UIImage?, style: UIBarButtonItemStyle, target:AnyObject? , block: STBarButtonItemBlock) {
    //        self.init()
    //        // self.title = title
    //
    //        self.image = image
    //        self.style = style
    //        self.target = target
    //
    //        action = #selector(UIBarButtonItem.buttonTapped)
    //        let wrapper = STBarButtonItemWrapper(block: block)
    //        objc_setAssociatedObject(self, &STConst.STBarButtonItemWrapperKey, wrapper, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    //    }
    
    @objc func buttonTapped() {
        guard let wrapper = objc_getAssociatedObject(self, &STConst.STBarButtonItemWrapperKey) as? STBarButtonItemWrapper else {
            return
        }
        guard let block = wrapper.block else {
            return
        }
        block()
    }
}

