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
    var unit = CGFloat()
    
    override func didMove(to view: SKView)
    {
        physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        unit = frame.height/15
        frog.physicsBody?.affectedByGravity = false
        frog.position = CGPoint(x: frame.midX, y: frame.minY+unit)
        frog.size = CGSize(width: unit, height: unit)
        frog.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        addChild(frog)
        makeCars(row: 5, speed: 10.0, fromRight: true, carWidth: 2)
        
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
        let hop = SKAction.moveBy(x: 0, y: unit, duration: 0.15)
        frog.run(hop)
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
    
    func makeCars(row: CGFloat, speed: TimeInterval, fromRight: Bool, carWidth: CGFloat)
    {
        let car = SKSpriteNode(color: UIColor.red, size: CGSize(width: unit, height: unit))
        car.name = "car"
        car.size = CGSize(width: unit*carWidth, height: unit)
        if fromRight == true
        {
            car.anchorPoint = CGPoint(x: 0.0, y: 1.0)
            car.position = CGPoint(x: frame.midX, y: frame.minY+row*(unit))
            let scroll = SKAction.moveBy(x: -frame.width, y: 0, duration: speed)
            addChild(car)
            car.run(scroll)

        }
        if fromRight == false
        {
            car.anchorPoint = CGPoint(x: 1.0, y: 1.0)
            car.position = CGPoint(x: frame.midX, y: frame.minY+row*(unit))
            let scroll = SKAction.moveBy(x: frame.width, y: 0, duration: speed)
            addChild(car)
            car.run(scroll)

        }
    }
    func makeLogs(row: CGFloat, speed: TimeInterval, fromRight: Bool, logWidth: CGFloat)
    {
        let log = SKSpriteNode(color: UIColor.red, size: CGSize(width: unit, height: unit))
        log.name = "log"
        log.size = CGSize(width: unit*logWidth, height: unit)
        if fromRight == true
        {
            log.anchorPoint = CGPoint(x: 0.0, y: 1.0)
            log.position = CGPoint(x: frame.maxX, y: row*(unit))
            let scroll = SKAction.moveBy(x: -frame.width, y: 0, duration: speed)
            addChild(log)
            log.run(scroll)
        }
        if fromRight == false
        {
            log.anchorPoint = CGPoint(x: 1.0, y: 1.0)
            log.position = CGPoint(x: frame.minX, y: row*(unit))
            //let scroll = SKAction.moveBy(x: frame.width, y: 0, duration: speed)
            addChild(log)
            //log.run(scroll)
        }
        addChild(log)
    }
}
