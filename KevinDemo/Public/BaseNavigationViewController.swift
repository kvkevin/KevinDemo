//
//  UIView.swift
//  KevinDemo
//
//  Created by kevin on 2018/3/6.
//  Copyright © 2018年 kevin. All rights reserved.
//

import UIKit

class BaseNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let bar = UINavigationBar.appearance(whenContainedInInstancesOf: [UINavigationController.self])
        //        let bar = UINavigationBar.appearanceWhenContainedInInstancesOfClasses([self])
        //设置镂空颜色
//        bar.tintColor = UIColor.mainColor
        //拿到按钮
//        let item = UIBarButtonItem.appearance(whenContainedInInstancesOf: [BaseNavigationViewController.self])
////        //        let item = UIBarButtonItem.appearanceWhenContainedInInstancesOfClasses([self])
////        //设置label偏移量
//        item.setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -100), for: .default)
        
        
        // Do any additional setup after loading the view.
        
//        if self.childViewControllers.count > 1 {
   
//        }
//        navigationBar.layer.shadowOffset = CGSize(width: 0, height: 3)
//        navigationBar.layer.shadowColor = UIColor.black.cgColor
//        navigationBar.layer.shadowOpacity = 0.3
//        navigationBar.layer.shadowRadius = 3
        navigationBar.tintColor = UIColor.black
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        if self.children.count > 1 {
            interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
//            navigationController.interactivePopGestureRecognizer.delegate=(id)self;
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "leftIcon"), style: .plain, block: {
                viewController.navigationController?.popViewController(animated: true)
            })
        }
    }
    

    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override public init(rootViewController: UIViewController) {
//        super.init(rootViewController: rootViewController)
//        let bar = UINavigationBar.appearance(whenContainedInInstancesOf: [BaseNavigationViewController.self])
//        //        let bar = UINavigationBar.appearanceWhenContainedInInstancesOfClasses([self])
//        //设置镂空颜色
//        bar.tintColor = UIColor.mainColor
//        //拿到按钮
//        let item = UIBarButtonItem.appearance(whenContainedInInstancesOf: [BaseNavigationViewController.self])
//        //        let item = UIBarButtonItem.appearanceWhenContainedInInstancesOfClasses([self])
//        //设置label偏移量
//        item.setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -100), for: .default)
//
//    }

}

//extension BaseNavigationViewController {
//
//}
