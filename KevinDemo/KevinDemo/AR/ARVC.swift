//
//  ARVC.swift
//  KevinDemo
//
//  Created by zm on 2018/9/28.
//  Copyright © 2018年 zm. All rights reserved.
//

import UIKit
import ARKit

class ARVC: BaseViewController,ARSCNViewDelegate,ARSessionDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func initUI() {
        let AugmentedView = ARSCNView()
        self.view = AugmentedView
        
        
    }
    


}
