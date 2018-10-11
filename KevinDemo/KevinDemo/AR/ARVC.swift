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
    private lazy var augmentedView = ARSCNView()
    private lazy var augmentedSession = augmentedView.session
    private lazy var augmentedScene = augmentedView.scene
    private var augmentedFrame: ARFrame? { return augmentedSession.currentFrame }
    private var augmentedCamera: ARCamera? {return augmentedFrame?.camera}
    private lazy var augmentedConfiguration  = ARWorldTrackingConfiguration()
    private lazy var selectionFeedbackGenrator = UISelectionFeedbackGenerator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //
    func initUI() {
        augmentedView.delegate = self
        
        self.view = augmentedView
        
        
        
    }
    


}
