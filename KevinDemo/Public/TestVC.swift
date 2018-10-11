//
//  UIView.swift
//  KevinDemo
//
//  Created by kevin on 2018/3/6.
//  Copyright © 2018年 kevin. All rights reserved.
//

import UIKit
//MARK: 测试VC  ==kevin注释==
class TestVC: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        test()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func test() {
        //断言
        assert(true, "message")
    }
}
