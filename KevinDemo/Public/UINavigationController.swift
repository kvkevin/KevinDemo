//
//  UIView.swift
//  KevinDemo
//
//  Created by kevin on 2018/3/6.
//  Copyright © 2018年 kevin. All rights reserved.
//

import UIKit

private var kBackgroundViewKey = "kBackgroundViewKey"
private var kStatusBarMaskKey  = "kStatusBarMaskKey"

extension UINavigationController {
    
    public func presentTransparentNavigationBar() {
        navigationBar.setBackgroundImage(UIImage(), for:UIBarMetrics.default)
        navigationBar.isTranslucent = true
        navigationBar.shadowImage = UIImage()
        setNavigationBarHidden(false, animated:true)
    }
    
    public func hideTransparentNavigationBar() {
        setNavigationBarHidden(true, animated:false)
        navigationBar.setBackgroundImage(nil, for:UIBarMetrics.default)
        navigationBar.isTranslucent = UINavigationBar.appearance().isTranslucent
        navigationBar.shadowImage = nil
    }
    
    
    
    public func df_setBackgroundColor(_ color: UIColor) {
        if backgroundView == nil {
            navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            navigationBar.shadowImage = UIImage()
            backgroundView = UIView(frame: CGRect(x: 0, y: -20, width: UIScreen.main.bounds.width, height: 64))
            backgroundView?.isUserInteractionEnabled = false
            backgroundView?.autoresizingMask = [.flexibleHeight,.flexibleWidth]
            navigationBar.insertSubview(backgroundView!, at: 0)
        }
        backgroundView?.backgroundColor = color
        
    }
    
    public func df_setStatusBarMaskColor(_ color: UIColor) {
        if statusBarMask == nil {
            statusBarMask = UIView(frame: CGRect(x: 0, y: -20, width: UIScreen.main.bounds.width, height: 20))
            statusBarMask?.autoresizingMask = [.flexibleWidth,.flexibleHeight]
            if let tempBackgroundView = backgroundView {
                navigationBar.insertSubview(statusBarMask!, aboveSubview: tempBackgroundView)
            }else {
                navigationBar.insertSubview(statusBarMask!, at: 0)
            }
        }
        statusBarMask?.backgroundColor = color
    }
    
    public func df_reset() {
        navigationBar.setBackgroundImage(nil, for: .default)
        navigationBar.shadowImage = nil
        
        backgroundView?.removeFromSuperview()
        backgroundView = nil
    }
    
    
    
    
    // MARK: Properties
    fileprivate var backgroundView:UIView? {
        get {
            return objc_getAssociatedObject(self, &kBackgroundViewKey) as? UIView
        }
        set {
            objc_setAssociatedObject(self, &kBackgroundViewKey, newValue, .OBJC_ASSOCIATION_RETAIN)
            
        }
    }
    
    fileprivate var statusBarMask:UIView? {
        get {
            return objc_getAssociatedObject(self, &kStatusBarMaskKey) as? UIView
        }
        set {
            objc_setAssociatedObject(self, &kStatusBarMaskKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    
    func addRightItem(current: AnyClass,
                      itemTitle:String,
                      handle: @escaping STBarButtonItemBlock) {
        let rightItme = UIBarButtonItem.init(title: itemTitle, style: .plain, block: handle)
        rightItme.tintColor = UIColor.mainColor
        let childre = children
        childre.forEach{
            if $0.isKind(of: current) {
                $0.navigationItem.setRightBarButtonItems([rightItme], animated: false)
            }
        }
    }
    
//    func red_pushViewController(_ viewController: UIViewController, animated: Bool) {
//        if self.childViewControllers.count > 1 {
//            interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
//            //            navigationController.interactivePopGestureRecognizer.delegate=(id)self;
//            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "leftIcon"), style: .plain, block: {
//                viewController.navigationController?.popViewController(animated: true)
//            })
//        }
//        pushViewController(viewController, animated: animated)
//    }
}

