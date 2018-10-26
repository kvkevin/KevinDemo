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
    private lazy var pimpNode  = PumpkinNode()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        addReSetbtn()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //初始化
    func initUI() {
        augmentedView.delegate = self
        self.view = augmentedView
        augmentedView.debugOptions =  [.showWorldOrigin,.showFeaturePoints]//设置调试信息

        
        
    }
    
    //页面出现开始AR识别
    override func viewWillAppear(_ animated: Bool) {
        augmentedSession.run(augmentedConfiguration)//启动AR
        augmentedScene.rootNode.addChildNode(pimpNode)//添加南瓜

    }
    
    //页面消失AR 停止
    override func viewWillDisappear(_ animated: Bool) {
        augmentedSession.pause()
    }
    
    
    //navigationbar右边添加重新识别按钮
    func addReSetbtn() {
        let rightItem = UIBarButtonItem(title: "ReSet", style:.plain) {
            print("重新识别")
            self.selectionFeedbackGenrator.selectionChanged()
            self.augmentedScene.rootNode.childNodes.forEach{$0.removeFromParentNode()}
            self.augmentedSession.run(self.augmentedConfiguration, options:.resetTracking)
        }
        rightItem.tintColor = UIColor.mainColor
        self.navigationItem.rightBarButtonItem =  rightItem
    }
    
    
    
    
    func sessionWasInterrupted(_ session: ARSession) {
        print("AR被打断")
    }
    func sessionInterruptionEnded(_ session: ARSession) {
        augmentedSession.run(augmentedConfiguration, options: .resetTracking)
    }
    func session(_ session: ARSession, didFailWithError error: Error) {
        print(error)
        augmentedSession.run(augmentedConfiguration, options: .resetTracking)
    }
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        frame.rawFeaturePoints.debugDescription
    }
    
    
    


}
