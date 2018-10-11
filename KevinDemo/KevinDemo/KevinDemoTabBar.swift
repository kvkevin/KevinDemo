//
//  KevinDemoTabBar.swift
//  KevinDemo
//
//  Created by zm on 2018/9/28.
//  Copyright © 2018年 zm. All rights reserved.
//

import UIKit

class KevinDemoTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        creatViewControllers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
     //MARK:创建ViewControllers  ==kevin注释==
    func creatViewControllers(){
        let homeVC = HomeVC()
        let arVC = ARVC()
        let chatVC  = ChatVC()
        let mineVC = MineVC()
        let nivHome = BaseNavigationViewController(rootViewController: homeVC)
        let nivAR = BaseNavigationViewController(rootViewController: arVC)
        let nivChat = BaseNavigationViewController(rootViewController: chatVC)
        let nivMine = BaseNavigationViewController(rootViewController: mineVC)
        let VCArray:[UIViewController] = [nivHome,nivAR,nivChat,nivMine]
//        self.viewControllers  = VCArray
        let title:[String] = ["首页","AR","聊天","我的"]
        let iconArray = ["homeIcon","ARicon","chaticon","mineicon"]
        let selectArray = ["","","",""]
//        tabBar.backgroundColor = UIColor.mainColor
        var tabArray:[UIViewController] = []
        for i in 0..<VCArray.count{
            let vc = VCArray[i]
            vc.tabBarItem.title = title[i]
            vc.tabBarItem.image  = UIImage(named:iconArray[i])?.withRenderingMode(.alwaysOriginal)
            vc.tabBarItem.selectedImage = UIImage(named:selectArray[i])?.withRenderingMode(.alwaysOriginal)
            tabArray.append(vc)
        }
        self.viewControllers = tabArray
        self.tabBar.tintColor = UIColor.mainColor
      }
        
 
}
