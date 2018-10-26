//
//  PumpkinNode.swift
//  RedBot
//
//  Created by zm on 2018/10/19.
//  Copyright © 2018年 redsip. All rights reserved.
//

import UIKit
import ARKit

class PumpkinNode: SCNNode {

    override init() {
        super.init()
        self.position = SCNVector3(0, 0, -3)
        let scene = SCNScene(named: "art.scnassets/pumpkin.dae")!
//        addChildNodes(scene.rootNode.childNodes)
//                let node = SCNNode()
                for child in scene.rootNode.childNodes {
                    self.addChildNode(child)
                }
//        simdTransform = .makeTranslation(amount: float3(0, -3, 3))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
