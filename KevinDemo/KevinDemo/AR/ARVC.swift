//
//  ARVC.swift
//  KevinDemo
//
//  Created by zm on 2018/9/28.
//  Copyright © 2018年 zm. All rights reserved.
//

import UIKit
import ARKit
import SceneKit

class ARVC: BaseViewController,ARSCNViewDelegate,ARSessionDelegate{
    private lazy var augmentedView = ARSCNView()
    private lazy var augmentedSession = augmentedView.session
    private lazy var augmentedScene = augmentedView.scene
    private var augmentedFrame: ARFrame? { return augmentedSession.currentFrame }
    private var augmentedCamera: ARCamera? {return augmentedFrame?.camera}
    private lazy var augmentedConfiguration  = ARWorldTrackingConfiguration()
    private lazy var selectionFeedbackGenrator = UISelectionFeedbackGenerator()
    private lazy var pumpNode  = PumpkinNode()
    var wolfNode: SCNNode!

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        addReSetbtn()
//        let scene = SCNScene()
//        augmentedScene = scene
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //初始化
    func initUI() {
        augmentedView.delegate = self
        augmentedView.showsStatistics =  true
        self.view = augmentedView
        augmentedConfiguration.planeDetection = .horizontal
        augmentedView.debugOptions =  [.showFeaturePoints]//设置调试信息

        
        
    }
    
    //页面出现开始AR识别
    override func viewWillAppear(_ animated: Bool) {
        augmentedSession.run(augmentedConfiguration)//启动AR
//        augmentedScene.rootNode.addChildNode(pumpNode)//添加南瓜
        

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
    
    
    /** create and return ARPlaneNode */
    func createARPlaneNode(anchor: ARPlaneAnchor) -> SCNNode {
        let pos = SCNVector3Make(anchor.transform.columns.3.x, anchor.transform.columns.3.y, anchor.transform.columns.3.z)
        //        print("New surface detected at \(pos)")
        
        // Create the geometry and its materials
        let plane = SCNPlane(width: CGFloat(anchor.extent.x), height: CGFloat(anchor.extent.z))
        let grassImage = UIImage(named: "grass")
        let grassMaterial = SCNMaterial()
        grassMaterial.diffuse.contents = grassImage
        grassMaterial.isDoubleSided = true
        plane.materials = [grassMaterial]
        // Create a plane node with the plane geometry
        let planeNode = SCNNode(geometry: plane)
        planeNode.position = pos
        planeNode.transform = SCNMatrix4MakeRotation(-Float.pi / 2, 1, 0, 0)
        
        // add the wolf to pos of the plane node
        if wolfNode == nil {
            if let wolfScene = SCNScene(named: "art.scnassets/pumpkin.dae") {
//                wolfNode = wolfScene.rootNode.childNode(withName: "pumpkin", recursively: true)
                wolfNode = wolfScene.rootNode.childNodes.first
                pumpNode.position = pos
//                augmentedView.scene.rootNode.addChildNode(wolfNode!)
                pumpNode.scale = SCNVector3Make(0.3, 0.3, 0.3)
                augmentedScene.rootNode.addChildNode(pumpNode)//添加南瓜

            }
        }
        return planeNode
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
    
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
//        print(node)
//        print(anchor.accessibilityActivationPoint)
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        let planeNode = createARPlaneNode(anchor: planeAnchor)
//        node.addChildNode(planeNode)
        
        
    }
    
    
    
    // when detected new plane, update
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
        // remove existing plane nodes
        node.enumerateChildNodes { (childNode, _) in
            childNode.removeFromParentNode()
        }
        let planeNode = createARPlaneNode(anchor: planeAnchor)
//        node.addChildNode(planeNode)
    }
    
    
    // when detected plane removed, didRemove the plane
    func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor) {
        guard anchor is ARPlaneAnchor else { return }
        // remove existing plane nodes
        node.enumerateChildNodes { (childNode, _) in
            childNode.removeFromParentNode()
        }
    }
    
    


}
