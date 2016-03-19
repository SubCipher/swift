//
//  GameScene.swift
//  SpriteKitSimpleGame
//
//  Created by knax on 3/18/16.
//  Copyright (c) 2016 knax. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    //1
    let player = SKSpriteNode(imageNamed: "player")
    
    override func didMoveToView(view: SKView) {
        //2
        backgroundColor = SKColor.whiteColor()
        //3
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
        //
        addChild(player)
    }
}

func random() -> CGFloat{
    return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
}

func random(min min: CGFloat, max: CGFloat) -> CGFloat {
    return random() * (max - min) + min
}

func addMonster() {
    //Create sprite
    let monster = SKSpriteNode(imageNamed: "monster")
    
    //Determine where to spawn the monster along the Y axis
   let actualY = random(min: monster.size.height/2, max: monster.size.height - monster.size.height/2)
    
    //Position the monster slighly off-screen along the right edge
    //amd along a random position along the Y axis as calculated above
    monster.position = CGPoint(x: monster.size.width + monster.size.width/2, y: actualY)
    
    //Add the monster to the scene
     addChild(monster)
    
    //Determine speed of the monster
    let actualDuration = random(min:CGFloat(2.0),max: CGFloat(4.0))
    
    //create the action
    let actionMove = SKAction.moveTo(CGPoint(x: -monster.size.width/2, y: actualY),duration: NSTimeInterval(actualDuration))
    let actionMoveDone = SKAction.removeFromParent()
    monster.runAction(SKAction.sequence([actionMove, actionMoveDone]))

    
    
}







