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
    

    
    var rowTimer1: Timer!
    var rowTimer2: Timer!
    var rowTimer3: Timer!
    var rowTimer4: Timer!
    var rowTimer5: Timer!
    var rowTimer6: Timer!
    var rowTimer7: Timer!
    var rowTimer8: Timer!
    var rowTimer9: Timer!
    var rowTimer10: Timer!
    var rowTimer11: Timer!
    var rowTimer12: Timer!
    var rowTimer13: Timer!
    
    var fromRight1 = Bool
    var fromRight2 = Bool
    var fromRight3 = Bool
    var fromRight4 = Bool
    var fromRight5 = Bool
    var fromRight6 = Bool
    var fromRight7 = Bool
    var fromRight8 = Bool
    var fromRight9 = Bool
    var fromRight10 = Bool
    var fromRight11 = Bool
    var fromRight12 = Bool
    var fromRight13 = Bool
    var fromRight14 = Bool

    var movingRows: Int = 1
    
    override func didMove(to view: SKView)
    {
        physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        unit = frame.height/15
        swipeRightRec.addTarget(self, action: #selector(GameScene.swipedRight))
        swipeRightRec.direction = .right
        self.view!.addGestureRecognizer(swipeRightRec)
        swipeLeftRec.addTarget(self, action: #selector(GameScene.swipedLeft))
        swipeLeftRec.direction = .left
        self.view!.addGestureRecognizer(swipeLeftRec)
        swipeUpRec.addTarget(self, action: #selector(GameScene.swipedUp))
        swipeUpRec.direction = .up
        self.view!.addGestureRecognizer(swipeUpRec)
        swipeDownRec.addTarget(self, action: #selector(GameScene.swipedDown))
        swipeDownRec.direction = .down
        self.view!.addGestureRecognizer(swipeDownRec)
        makeFrog()
        makeRows()
        repeatRows()
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
    
    func randomNumber(MIN: Int, MAX: Int)-> Int
    {
        return Int(arc4random_uniform(UInt32(MAX)) + UInt32(MIN));
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
    
    func makeRows()
    {
        let carOrLog = 1
        let fromRight = randomNumber(MIN: 1, MAX: 2)
        let speed = randomNumber(MIN: 8, MAX: 10)
        let size = randomNumber(MIN: 1, MAX: 3)

        if carOrLog == 1
        {
            let car = SKSpriteNode(color: UIColor.red, size: CGSize(width: unit, height: unit))
            car.name = "car"
            car.size = CGSize(width: unit*CGFloat(size), height: unit)
            car.physicsBody = SKPhysicsBody(rectangleOf: car.size)
            car.physicsBody?.affectedByGravity = false
            car.physicsBody?.isDynamic = false
            car.physicsBody?.contactTestBitMask = (car.physicsBody?.collisionBitMask)!
            if fromRight == 1
            {
                
                car.position = CGPoint(x: frame.maxX, y: frame.minY+2*(unit))
                let scroll = SKAction.moveBy(x: -frame.width*1.5, y: 0, duration: TimeInterval(speed))
                addChild(car)
                car.run(scroll)
            }
            else
            {
                car.position = CGPoint(x: frame.minX, y: frame.minY+2*(unit))
                let scroll = SKAction.moveBy(x: frame.width*1.5, y: 0, duration: TimeInterval(speed))
                addChild(car)
                car.run(scroll)
            }
        }
    }
    func repeatRows()
    {
        
        rowTimer1 = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.makeRows), userInfo: nil, repeats: true)
    }
}
