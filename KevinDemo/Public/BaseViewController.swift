//
//  UIView.swift
//  KevinDemo
//
//  Created by kevin on 2018/3/6.
//  Copyright © 2018年 kevin. All rights reserved.
//

import UIKit
 //MARK: BaseVC  ==kevin注释==

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        initNavigationBar()
        self.view.backgroundColor  = UIColor.white
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
     //MARK: navigationbar上添加自定义图片  ==kevin注释==
    func initNavigationBar(){
        let titleView = UIImageView(frame: CGRect(x: 0, y: 0, width: 90, height: 25))
        titleView.image = #imageLiteral(resourceName: "nivTitle")
        navigationItem.titleView = titleView
        
    }
}
