//
//  GameScene.swift
//  Ryan Frogger
//
//  Created by Student on 5/2/17.
//  Copyright © 2017 Scott & Carter. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate
{
    
    var frog = SKSpriteNode(color: UIColor.orange, size: CGSize(width: 50, height: 50))
    
    override func didMove(to view: SKView)
    {
        physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        frog.physicsBody?.affectedByGravity = false
        frog.position = CGPoint(x: frame.midX, y: frame.minY+frame.height/15)
        frog.size = CGSize(width: frame.height/15, height: frame.height/15)
        frog.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        addChild(frog)
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
    }
    
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        frog.position.y = frog.position.y + frame.height/15
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
