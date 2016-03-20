//
//  GameOverScene.swift
//  SpriteKitSimpleGame
//
//  Created by knax on 3/20/16.
//  Copyright © 2016 knax. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene    {
    
    init(size: CGSize, won:Bool) {
        super.init(size: size)
        //1
        backgroundColor = SKColor()
        
        //2
        let message = won ? "You Won!" : "You Lose :["
        //3
        let label = SKLabelNode(fontNamed: "Chalkduster")
        label.text = message
        label.fontSize = 40
        label.fontColor = SKColor.blackColor()
        label.position = CGPoint(x: size.width/2, y:size.height/2)
        addChild(label)
        
        //4
        runAction(SKAction.sequence([
            SKAction.waitForDuration(3.0),
            SKAction.runBlock() {
                //5
                let reveal = SKTransition.flipHorizontalWithDuration(0.5)
                let scene = GameScene(size: size)
                self.view?.presentScene(scene,transition:reveal)
                }
            ]))
        }
    required init(coder aDecoder: NSCoder){
        fatalError("init(coder:)has not been implemented")
        
    }
    
}