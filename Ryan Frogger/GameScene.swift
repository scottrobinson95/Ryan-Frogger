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
    
    let swipeRightRec = UISwipeGestureRecognizer()
    let swipeLeftRec = UISwipeGestureRecognizer()
    let swipeUpRec = UISwipeGestureRecognizer()
    let swipeDownRec = UISwipeGestureRecognizer()
    
    var urow = CGFloat()
    var uspeed = TimeInterval()
    var ufromRight = Bool()
    var uwidth = CGFloat()
    
    var carTimer1: Timer!
    var carTimer2: Timer!
    override func didMove(to view: SKView)
    {
        physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        unit = frame.height/15
        swipeRightRec.addTarget(self, action: #selector(GameScene.swipedRight) )
        swipeRightRec.direction = .right
        self.view!.addGestureRecognizer(swipeRightRec)
        swipeLeftRec.addTarget(self, action: #selector(GameScene.swipedLeft) )
        swipeLeftRec.direction = .left
        self.view!.addGestureRecognizer(swipeLeftRec)
        swipeUpRec.addTarget(self, action: #selector(GameScene.swipedUp) )
        swipeUpRec.direction = .up
        self.view!.addGestureRecognizer(swipeUpRec)
        swipeDownRec.addTarget(self, action: #selector(GameScene.swipedDown) )
        swipeDownRec.direction = .down
        self.view!.addGestureRecognizer(swipeDownRec)
        makeFrog()
        makeLane(laneRow: 3, laneSpeed: 5.0, laneFromRight: true, laneCarWidth: 2, interval: 2.0)
        makeLane(laneRow: 5, laneSpeed: 4.0, laneFromRight: false, laneCarWidth: 3, interval: 4.0)
        
    }
    
    func swipedRight()
    {
        let hop = SKAction.moveBy(x: unit, y: 0, duration: 0.15)
        frog.run(hop)
    }
    
    func swipedLeft()
    {
        let hop = SKAction.moveBy(x: -unit, y: 0, duration: 0.15)
        frog.run(hop)    }
    
    func swipedUp()
    {
        let hop = SKAction.moveBy(x: 0, y: unit, duration: 0.15)
        frog.run(hop)
    }
    
    func swipedDown()
    {
        let hop = SKAction.moveBy(x: 0, y: -unit, duration: 0.15)
        frog.run(hop)    }
    
    func didBegin(_ contact: SKPhysicsContact)
    {
        print("splat")
        if contact.bodyA.node?.name == "car" || contact.bodyB.node?.name == "car"
        {
            frog.removeFromParent()
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
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
    
    func makeFrog()
    {
        frog.physicsBody?.affectedByGravity = false
        frog.position = CGPoint(x: frame.midX, y: frame.minY+unit)
        frog.size = CGSize(width: unit-5, height: unit-5)
        frog.physicsBody = SKPhysicsBody(rectangleOf: frog.size)
        frog.physicsBody?.usesPreciseCollisionDetection = true
        frog.physicsBody?.isDynamic = true
        frog.physicsBody?.affectedByGravity = false
        
        addChild(frog)
    }
    
    func makeCars(row: CGFloat, speed: TimeInterval, fromRight: Bool, carWidth: CGFloat)
    {
        let car = SKSpriteNode(color: UIColor.red, size: CGSize(width: unit, height: unit))
        car.name = "car"
        car.size = CGSize(width: unit*carWidth, height: unit)
        car.physicsBody = SKPhysicsBody(rectangleOf: car.size)
        car.physicsBody?.affectedByGravity = false
        car.physicsBody?.isDynamic = false
        car.physicsBody?.contactTestBitMask = (car.physicsBody?.collisionBitMask)!
        if fromRight == true
        {
            car.position = CGPoint(x: frame.maxX, y: frame.minY+row*(unit))
            let scroll = SKAction.moveBy(x: -frame.width*1.5, y: 0, duration: speed)
            addChild(car)
            car.run(scroll)

        }
        if fromRight == false
        {
            car.position = CGPoint(x: frame.minX, y: frame.minY+row*(unit))
            let scroll = SKAction.moveBy(x: frame.width*1.5, y: 0, duration: speed)
            addChild(car)
            car.run(scroll)

        }
    }
    
    func makeLogs(row: CGFloat, speed: TimeInterval, fromRight: Bool, logWidth: CGFloat)
    {
        let log = SKSpriteNode(color: UIColor.brown, size: CGSize(width: unit, height: unit))
        log.name = "log"
        log.size = CGSize(width: unit*logWidth, height: unit)
        log.physicsBody = SKPhysicsBody(rectangleOf: log.size)
        log.physicsBody?.affectedByGravity = false
        log.physicsBody?.isDynamic = true
        log.physicsBody?.contactTestBitMask = (log.physicsBody?.collisionBitMask)!

        if fromRight == true
        {
            log.position = CGPoint(x: frame.maxX, y: row*(unit))
            let scroll = SKAction.moveBy(x: -frame.width*1.5, y: 0, duration: speed)
            addChild(log)
            log.run(scroll)
        }
        if fromRight == false
        {
            log.position = CGPoint(x: frame.minX*1.5, y: row*(unit))
            //let scroll = SKAction.moveBy(x: frame.width, y: 0, duration: speed)
            addChild(log)
            //log.run(scroll)
        }
        addChild(log)
    }
    
    func makeLane(laneRow: CGFloat, laneSpeed: TimeInterval, laneFromRight: Bool, laneCarWidth: CGFloat, interval: TimeInterval)
    {
        urow = laneRow
        uspeed = laneSpeed
        ufromRight = laneFromRight
        uwidth = laneCarWidth
        let carTimer1 = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(self.updateCounter), userInfo: nil, repeats: true)
    }
    func updateCounter()
    {
        makeCars(row: urow, speed: uspeed, fromRight: ufromRight, carWidth: uwidth)
    }
}
