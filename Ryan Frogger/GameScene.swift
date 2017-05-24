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
    
    var frog = SKSpriteNode(imageNamed: "Grogger")
    var unit = CGFloat()
    
    let swipeRightRec = UISwipeGestureRecognizer()
    let swipeLeftRec = UISwipeGestureRecognizer()
    let swipeUpRec = UISwipeGestureRecognizer()
    let swipeDownRec = UISwipeGestureRecognizer()
    
    var score = 0
    var lives = 3
    
    let scoreLabel = SKLabelNode()
    let livesLabel = SKLabelNode()
    
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
    
    var fromRight1 : Int = 0
    var fromRight2 : Int = 0
    var fromRight3 : Int = 0
    var fromRight4 : Int = 0
    var fromRight5 : Int = 0
    var fromRight6 : Int = 0
    var fromRight7 : Int = 0
    var fromRight8 : Int = 0
    var fromRight9 : Int = 0
    var fromRight10 : Int = 0
    var fromRight11 : Int = 0
    var fromRight12 : Int = 0
    var fromRight13 : Int = 0
    
    var speed1 : Int = 0
    var speed2 : Int = 0
    var speed3 : Int = 0
    var speed4 : Int = 0
    var speed5 : Int = 0
    var speed6 : Int = 0
    var speed7 : Int = 0
    var speed8 : Int = 0
    var speed9 : Int = 0
    var speed10 : Int = 0
    var speed11 : Int = 0
    var speed12 : Int = 0
    var speed13 : Int = 0
    
    var size1 : Int = 0
    var size2 : Int = 0
    var size3 : Int = 0
    var size4 : Int = 0
    var size5 : Int = 0
    var size6 : Int = 0
    var size7 : Int = 0
    var size8 : Int = 0
    var size9 : Int = 0
    var size10 : Int = 0
    var size11 : Int = 0
    var size12 : Int = 0
    var size13 : Int = 0
    
    var rowType1 : Int = 1
    var rowType2 : Int = 1
    var rowType3 : Int = 1
    var rowType4 : Int = 1
    var rowType5 : Int = 1
    var rowType6 : Int = 1
    var rowType7 : Int = 1
    var rowType8 : Int = 1
    var rowType9 : Int = 1
    var rowType10 : Int = 1
    var rowType11 : Int = 1
    var rowType12 : Int = 1
    var rowType13 : Int = 1
    

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
        fromRight1 = randomNumber(MIN: 1, MAX: 2)
        fromRight2 = randomNumber(MIN: 1, MAX: 2)
        fromRight3 = randomNumber(MIN: 1, MAX: 2)
        fromRight4 = randomNumber(MIN: 1, MAX: 2)
        fromRight5 = randomNumber(MIN: 1, MAX: 2)
        fromRight6 = randomNumber(MIN: 1, MAX: 2)
        fromRight7 = randomNumber(MIN: 1, MAX: 2)
        fromRight8 = randomNumber(MIN: 1, MAX: 2)
        fromRight9 = randomNumber(MIN: 1, MAX: 2)
        fromRight10 = randomNumber(MIN: 1, MAX: 2)
        fromRight11 = randomNumber(MIN: 1, MAX: 2)
        fromRight12 = randomNumber(MIN: 1, MAX: 2)
        fromRight13 = randomNumber(MIN: 1, MAX: 2)
        size1 = randomNumber(MIN: 1, MAX: 3)
        size2 = randomNumber(MIN: 1, MAX: 3)
        size3 = randomNumber(MIN: 1, MAX: 3)
        size4 = randomNumber(MIN: 1, MAX: 3)
        size5 = randomNumber(MIN: 1, MAX: 3)
        size6 = randomNumber(MIN: 1, MAX: 3)
        size7 = randomNumber(MIN: 1, MAX: 3)
        size8 = randomNumber(MIN: 1, MAX: 3)
        size9 = randomNumber(MIN: 1, MAX: 3)
        size10 = randomNumber(MIN: 1, MAX: 3)
        size11 = randomNumber(MIN: 1, MAX: 3)
        size12 = randomNumber(MIN: 1, MAX: 3)
        size13 = randomNumber(MIN: 1, MAX: 3)
        speed1 = randomNumber(MIN: 3, MAX: 5)
        speed2 = randomNumber(MIN: 3, MAX: 5)
        speed3 = randomNumber(MIN: 3, MAX: 5)
        speed4 = randomNumber(MIN: 3, MAX: 5)
        speed5 = randomNumber(MIN: 3, MAX: 5)
        speed6 = randomNumber(MIN: 3, MAX: 5)
        speed7 = randomNumber(MIN: 3, MAX: 5)
        speed8 = randomNumber(MIN: 3, MAX: 5)
        speed9 = randomNumber(MIN: 3, MAX: 5)
        speed10 = randomNumber(MIN: 3, MAX: 5)
        speed11 = randomNumber(MIN: 3, MAX: 5)
        speed12 = randomNumber(MIN: 3, MAX: 5)
        speed13 = randomNumber(MIN: 3, MAX: 5)
     

        makeFrog()
        makeTopBorder()
        repeatRows()
        makeLabel(labelName: scoreLabel, labelText: "Score: \(score)", labelFontSize: 40, labelFontColor: UIColor.white, labelPosition: CGPoint(x: frame.minX+75, y: frame.minY+20))
        makeLabel(labelName: livesLabel, labelText: "Lives: \(lives)", labelFontSize: 40, labelFontColor: UIColor.white, labelPosition: CGPoint(x: frame.maxX - 75, y: frame.minY+20))
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
        frog.removeAllActions()
        
        
        if contact.bodyA.node?.name == "topBorder" || contact.bodyB.node?.name == "topBorder"
        {
            
            reset()
            score += 1
            scoreLabel.text = "Score: \(score)"
            
        }
        if contact.bodyA.node?.name == "car" || contact.bodyB.node?.name == "car"
        {
            frog.removeFromParent()
            makeFrog()
            lives -= 1
            livesLabel.text = "Lives: \(lives)"
            checkWin()
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
    
    func makeTopBorder()
    {
        let topBorder = SKSpriteNode(color: UIColor.green, size: CGSize(width: frame.width, height: unit))
        topBorder.name = "topBorder"
        topBorder.position = CGPoint(x: frame.midX, y: frame.maxY)
        topBorder.physicsBody = SKPhysicsBody(rectangleOf: topBorder.size)
        topBorder.physicsBody?.affectedByGravity = false
        topBorder.physicsBody?.isDynamic = false
        topBorder.physicsBody?.contactTestBitMask = (topBorder.physicsBody?.collisionBitMask)!
        addChild(topBorder)
        
    }
    
    func makeLabel(labelName: SKLabelNode,labelText: String, labelFontSize: CGFloat, labelFontColor: UIColor, labelPosition: CGPoint)
    {
        
        labelName.text = labelText
        labelName.fontSize = labelFontSize
        labelName.position = labelPosition
        labelName.fontColor = labelFontColor
        
        addChild(labelName)
    }
    func makeRow1()
    {
        var car = SKSpriteNode(imageNamed: "carright")
            if fromRight1 == 1
            {
                car = SKSpriteNode(imageNamed: "carright")
            }
            else
            {
                car = SKSpriteNode(imageNamed: "carleft")
            }
        car.name = "car"
        car.size = CGSize(width: unit*CGFloat(size1), height: unit)
        car.physicsBody = SKPhysicsBody(rectangleOf: car.size)
        car.physicsBody?.affectedByGravity = false
        car.physicsBody?.isDynamic = false
        car.physicsBody?.contactTestBitMask = (car.physicsBody?.collisionBitMask)!

        if fromRight1 == 1
        {
            
            car.position = CGPoint(x: frame.maxX, y: frame.minY+2*(unit))
            let scroll = SKAction.moveBy(x: -frame.width*1.5, y: 0, duration: TimeInterval(speed1))
            addChild(car)
            car.run(scroll)
        }
        else
        {
            car.position = CGPoint(x: frame.minX, y: frame.minY+2*(unit))
            let scroll = SKAction.moveBy(x: frame.width*1.5, y: 0, duration: TimeInterval(speed1))
            addChild(car)
            car.run(scroll)
    
        }
    }
    func makeRow2()
    {
        
        var car = SKSpriteNode(imageNamed: "carright")
        if fromRight2 == 1
        {
            car = SKSpriteNode(imageNamed: "carright")
        }
        else
        {
            car = SKSpriteNode(imageNamed: "carleft")
        }
        car.name = "car"

        car.size = CGSize(width: unit*CGFloat(size2), height: unit)
        car.physicsBody = SKPhysicsBody(rectangleOf: car.size)
        car.physicsBody?.affectedByGravity = false
        car.physicsBody?.isDynamic = false
        car.physicsBody?.contactTestBitMask = (car.physicsBody?.collisionBitMask)!
        if fromRight2 == 1
        {
            
            car.position = CGPoint(x: frame.maxX, y: frame.minY+3*(unit))
            let scroll = SKAction.moveBy(x: -frame.width*1.5, y: 0, duration: TimeInterval(speed2))
            addChild(car)
            car.run(scroll)
        }
        else
        {
            car.position = CGPoint(x: frame.minX, y: frame.minY+3*(unit))
            let scroll = SKAction.moveBy(x: frame.width*1.5, y: 0, duration: TimeInterval(speed2))
            addChild(car)
            car.run(scroll)
            
        }
    }
    func makeRow3()
    {
        var car = SKSpriteNode(imageNamed: "carright")
        if fromRight3 == 1
        {
            car = SKSpriteNode(imageNamed: "carright")
        }
        else
        {
            car = SKSpriteNode(imageNamed: "carleft")
        }
        car.name = "car"

        car.size = CGSize(width: unit*CGFloat(size3), height: unit)
        car.physicsBody = SKPhysicsBody(rectangleOf: car.size)
        car.physicsBody?.affectedByGravity = false
        car.physicsBody?.isDynamic = false
        car.physicsBody?.contactTestBitMask = (car.physicsBody?.collisionBitMask)!
        if fromRight3 == 1
        {
            
            car.position = CGPoint(x: frame.maxX, y: frame.minY+4*(unit))
            let scroll = SKAction.moveBy(x: -frame.width*1.5, y: 0, duration: TimeInterval(speed3))
            addChild(car)
            car.run(scroll)
        }
        else
        {
            car.position = CGPoint(x: frame.minX, y: frame.minY+4*(unit))
            let scroll = SKAction.moveBy(x: frame.width*1.5, y: 0, duration: TimeInterval(speed3))
            addChild(car)
            car.run(scroll)
            
        }
    }
    func makeRow4()
    {
        
        var car = SKSpriteNode(imageNamed: "carright")
        if fromRight4 == 1
        {
            car = SKSpriteNode(imageNamed: "carright")
        }
        else
        {
            car = SKSpriteNode(imageNamed: "carleft")
        }
        car.name = "car"

        car.size = CGSize(width: unit*CGFloat(size4), height: unit)
        car.physicsBody = SKPhysicsBody(rectangleOf: car.size)
        car.physicsBody?.affectedByGravity = false
        car.physicsBody?.isDynamic = false
        car.physicsBody?.contactTestBitMask = (car.physicsBody?.collisionBitMask)!
        if fromRight4 == 1
        {
            
            car.position = CGPoint(x: frame.maxX, y: frame.minY+5*(unit))
            let scroll = SKAction.moveBy(x: -frame.width*1.5, y: 0, duration: TimeInterval(speed4))
            addChild(car)
            car.run(scroll)
        }
        else
        {
            car.position = CGPoint(x: frame.minX, y: frame.minY+5*(unit))
            let scroll = SKAction.moveBy(x: frame.width*1.5, y: 0, duration: TimeInterval(speed4))
            addChild(car)
            car.run(scroll)
            
        }
    }
    func makeRow5()
    {
        
        var car = SKSpriteNode(imageNamed: "carright")
        if fromRight5 == 1
        {
            car = SKSpriteNode(imageNamed: "carright")
        }
        else
        {
            car = SKSpriteNode(imageNamed: "carleft")
        }
        car.name = "car"

        car.size = CGSize(width: unit*CGFloat(size5), height: unit)
        car.physicsBody = SKPhysicsBody(rectangleOf: car.size)
        car.physicsBody?.affectedByGravity = false
        car.physicsBody?.isDynamic = false
        car.physicsBody?.contactTestBitMask = (car.physicsBody?.collisionBitMask)!
        if fromRight5 == 1
        {
            
            car.position = CGPoint(x: frame.maxX, y: frame.minY+6*(unit))
            let scroll = SKAction.moveBy(x: -frame.width*1.5, y: 0, duration: TimeInterval(speed5))
            addChild(car)
            car.run(scroll)
        }
        else
        {
            car.position = CGPoint(x: frame.minX, y: frame.minY+6*(unit))
            let scroll = SKAction.moveBy(x: frame.width*1.5, y: 0, duration: TimeInterval(speed5))
            addChild(car)
            car.run(scroll)
            
        }
    }
    func makeRow6()
    {
        var car = SKSpriteNode(imageNamed: "carright")
        if fromRight6 == 1
        {
            car = SKSpriteNode(imageNamed: "carright")
        }
        else
        {
            car = SKSpriteNode(imageNamed: "carleft")
        }
        car.name = "car"

        car.size = CGSize(width: unit*CGFloat(size6), height: unit)
        car.physicsBody = SKPhysicsBody(rectangleOf: car.size)
        car.physicsBody?.affectedByGravity = false
        car.physicsBody?.isDynamic = false
        car.physicsBody?.contactTestBitMask = (car.physicsBody?.collisionBitMask)!
        if fromRight6 == 1
        {
            
            car.position = CGPoint(x: frame.maxX, y: frame.minY+7*(unit))
            let scroll = SKAction.moveBy(x: -frame.width*1.5, y: 0, duration: TimeInterval(speed6))
            addChild(car)
            car.run(scroll)
        }
        else
        {
            car.position = CGPoint(x: frame.minX, y: frame.minY+7*(unit))
            let scroll = SKAction.moveBy(x: frame.width*1.5, y: 0, duration: TimeInterval(speed6))
            addChild(car)
            car.run(scroll)
            
        }
    }
    func makeRow7()
    {
        var car = SKSpriteNode(imageNamed: "carright")
        car.name = "car"
        if fromRight7 == 1
        {
            car = SKSpriteNode(imageNamed: "carright")
        }
        else
        {
            car = SKSpriteNode(imageNamed: "carleft")
        }
        car.name = "car"

        car.size = CGSize(width: unit*CGFloat(size7), height: unit)
        car.physicsBody = SKPhysicsBody(rectangleOf: car.size)
        car.physicsBody?.affectedByGravity = false
        car.physicsBody?.isDynamic = false
        car.physicsBody?.contactTestBitMask = (car.physicsBody?.collisionBitMask)!
        if fromRight7 == 1
        {
            
            car.position = CGPoint(x: frame.maxX, y: frame.minY+8*(unit))
            let scroll = SKAction.moveBy(x: -frame.width*1.5, y: 0, duration: TimeInterval(speed7))
            addChild(car)
            car.run(scroll)
        }
        else
        {
            car.position = CGPoint(x: frame.minX, y: frame.minY+8*(unit))
            let scroll = SKAction.moveBy(x: frame.width*1.5, y: 0, duration: TimeInterval(speed7))
            addChild(car)
            car.run(scroll)
            
        }
    }
    func makeRow8()
    {
        var car = SKSpriteNode(imageNamed: "carright")
        car.name = "car"
        if fromRight8 == 1
        {
            car = SKSpriteNode(imageNamed: "carright")
        }
        else
        {
            car = SKSpriteNode(imageNamed: "carleft")
        }
        car.name = "car"

        car.size = CGSize(width: unit*CGFloat(size8), height: unit)
        car.physicsBody = SKPhysicsBody(rectangleOf: car.size)
        car.physicsBody?.affectedByGravity = false
        car.physicsBody?.isDynamic = false
        car.physicsBody?.contactTestBitMask = (car.physicsBody?.collisionBitMask)!
        if fromRight8 == 1
        {
            
            car.position = CGPoint(x: frame.maxX, y: frame.minY+9*(unit))
            let scroll = SKAction.moveBy(x: -frame.width*1.5, y: 0, duration: TimeInterval(speed8))
            addChild(car)
            car.run(scroll)
        }
        else
        {
            car.position = CGPoint(x: frame.minX, y: frame.minY+9*(unit))
            let scroll = SKAction.moveBy(x: frame.width*1.5, y: 0, duration: TimeInterval(speed8))
            addChild(car)
            car.run(scroll)
            
        }
    }
    func makeRow9()
    {
        var car = SKSpriteNode(imageNamed: "carright")
        car.name = "car"
        if fromRight9 == 1
        {
            car = SKSpriteNode(imageNamed: "carright")
        }
        else
        {
            car = SKSpriteNode(imageNamed: "carleft")
        }
        car.name = "car"

        car.size = CGSize(width: unit*CGFloat(size9), height: unit)
        car.physicsBody = SKPhysicsBody(rectangleOf: car.size)
        car.physicsBody?.affectedByGravity = false
        car.physicsBody?.isDynamic = false
        car.physicsBody?.contactTestBitMask = (car.physicsBody?.collisionBitMask)!
        if fromRight9 == 1
        {
            
            car.position = CGPoint(x: frame.maxX, y: frame.minY+10*(unit))
            let scroll = SKAction.moveBy(x: -frame.width*1.5, y: 0, duration: TimeInterval(speed9))
            addChild(car)
            car.run(scroll)
        }
        else
        {
            car.position = CGPoint(x: frame.minX, y: frame.minY+10*(unit))
            let scroll = SKAction.moveBy(x: frame.width*1.5, y: 0, duration: TimeInterval(speed9))
            addChild(car)
            car.run(scroll)
            
        }
    }
    func makeRow10()
    {
        
        var car = SKSpriteNode(imageNamed: "carright")
        car.name = "car"
        if fromRight10 == 1
        {
            car = SKSpriteNode(imageNamed: "carright")
        }
        else
        {
            car = SKSpriteNode(imageNamed: "carleft")
        }
        car.name = "car"

        car.size = CGSize(width: unit*CGFloat(size10), height: unit)
        car.physicsBody = SKPhysicsBody(rectangleOf: car.size)
        car.physicsBody?.affectedByGravity = false
        car.physicsBody?.isDynamic = false
        car.physicsBody?.contactTestBitMask = (car.physicsBody?.collisionBitMask)!
        if fromRight10 == 1
        {
            
            car.position = CGPoint(x: frame.maxX, y: frame.minY+11*(unit))
            let scroll = SKAction.moveBy(x: -frame.width*1.5, y: 0, duration: TimeInterval(speed10))
            addChild(car)
            car.run(scroll)
        }
        else
        {
            car.position = CGPoint(x: frame.minX, y: frame.minY+11*(unit))
            let scroll = SKAction.moveBy(x: frame.width*1.5, y: 0, duration: TimeInterval(speed10))
            addChild(car)
            car.run(scroll)
            
        }
    }
    func makeRow11()
    {
        var car = SKSpriteNode(imageNamed: "carright")
        car.name = "car"
        if fromRight11 == 1
        {
            car = SKSpriteNode(imageNamed: "carright")
        }
        else
        {
            car = SKSpriteNode(imageNamed: "carleft")
        }`
        car.name = "car"

        car.size = CGSize(width: unit*CGFloat(size11), height: unit)
        car.physicsBody = SKPhysicsBody(rectangleOf: car.size)
        car.physicsBody?.affectedByGravity = false
        car.physicsBody?.isDynamic = false
        car.physicsBody?.contactTestBitMask = (car.physicsBody?.collisionBitMask)!
        if fromRight11 == 1
        {
            
            car.position = CGPoint(x: frame.maxX, y: frame.minY+12*(unit))
            let scroll = SKAction.moveBy(x: -frame.width*1.5, y: 0, duration: TimeInterval(speed11))
            addChild(car)
            car.run(scroll)
        }
        else
        {
            car.position = CGPoint(x: frame.minX, y: frame.minY+12*(unit))
            let scroll = SKAction.moveBy(x: frame.width*1.5, y: 0, duration: TimeInterval(speed11))
            addChild(car)
            car.run(scroll)
            
        }
    }
    func makeRow12()
    {
        var car = SKSpriteNode(imageNamed: "carright")
        car.name = "car"
        if fromRight12 == 1
        {
            car = SKSpriteNode(imageNamed: "carright")
        }
        else
        {
            car = SKSpriteNode(imageNamed: "carleft")
        }
        car.name = "car"

        car.size = CGSize(width: unit*CGFloat(size12), height: unit)
        car.physicsBody = SKPhysicsBody(rectangleOf: car.size)
        car.physicsBody?.affectedByGravity = false
        car.physicsBody?.isDynamic = false
        car.physicsBody?.contactTestBitMask = (car.physicsBody?.collisionBitMask)!
        if fromRight12 == 1
        {
            
            car.position = CGPoint(x: frame.maxX, y: frame.minY+13*(unit))
            let scroll = SKAction.moveBy(x: -frame.width*1.5, y: 0, duration: TimeInterval(speed12))
            addChild(car)
            car.run(scroll)
        }
        else
        {
            car.position = CGPoint(x: frame.minX, y: frame.minY+13*(unit))
            let scroll = SKAction.moveBy(x: frame.width*1.5, y: 0, duration: TimeInterval(speed12))
            addChild(car)
            car.run(scroll)
            
        }
    }
    func makeRow13()
    {
        var car = SKSpriteNode(imageNamed: "carright")
        car.name = "car"
        if fromRight13 == 1
        {
            car = SKSpriteNode(imageNamed: "carright")
        }
        else
        {
            car = SKSpriteNode(imageNamed: "carleft")
        }
        car.name = "car"

        car.size = CGSize(width: unit*CGFloat(size13), height: unit)
        car.physicsBody = SKPhysicsBody(rectangleOf: car.size)
        car.physicsBody?.affectedByGravity = false
        car.physicsBody?.isDynamic = false
        car.physicsBody?.contactTestBitMask = (car.physicsBody?.collisionBitMask)!
        if fromRight13 == 1
        {
            
            car.position = CGPoint(x: frame.maxX, y: frame.minY+14*(unit))
            let scroll = SKAction.moveBy(x: -frame.width*1.5, y: 0, duration: TimeInterval(speed13))
            addChild(car)
            car.run(scroll)
        }
        else
        {
            car.position = CGPoint(x: frame.minX, y: frame.minY+14*(unit))
            let scroll = SKAction.moveBy(x: frame.width*1.5, y: 0, duration: TimeInterval(speed13))
            addChild(car)
            car.run(scroll)
            
        }
    }
    func repeatRows()
    {
        makeRow1()
        rowTimer1 = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.makeRow1), userInfo: nil, repeats: false)
        rowTimer1 = Timer.scheduledTimer(timeInterval: TimeInterval(randomNumber(MIN: 4, MAX: 6)), target: self, selector: #selector(self.makeRow1), userInfo: nil, repeats: true)
        makeRow2()
        rowTimer2 = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.makeRow2), userInfo: nil, repeats: false)
        rowTimer2 = Timer.scheduledTimer(timeInterval: TimeInterval(randomNumber(MIN: 4, MAX: 6)), target: self, selector: #selector(self.makeRow2), userInfo: nil, repeats: true)
        makeRow3()
        rowTimer3 = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.makeRow3), userInfo: nil, repeats: false)
        rowTimer3 = Timer.scheduledTimer(timeInterval: TimeInterval(randomNumber(MIN: 4, MAX: 6)), target: self, selector: #selector(self.makeRow3), userInfo: nil, repeats: true)
        makeRow4()
        rowTimer4 = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.makeRow4), userInfo: nil, repeats: false)
        rowTimer4 = Timer.scheduledTimer(timeInterval: TimeInterval(randomNumber(MIN: 4, MAX: 6)), target: self, selector: #selector(self.makeRow4), userInfo: nil, repeats: true)
        makeRow5()
        rowTimer5 = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.makeRow5), userInfo: nil, repeats: false)
        rowTimer5 = Timer.scheduledTimer(timeInterval: TimeInterval(randomNumber(MIN: 4, MAX: 6)), target: self, selector: #selector(self.makeRow5), userInfo: nil, repeats: true)
        makeRow6()
        rowTimer6 = Timer.scheduledTimer(timeInterval: TimeInterval(randomNumber(MIN: 4, MAX: 6)), target: self, selector: #selector(self.makeRow6), userInfo: nil, repeats: true)
        makeRow7()
        rowTimer7 = Timer.scheduledTimer(timeInterval: TimeInterval(randomNumber(MIN: 4, MAX: 6)), target: self, selector: #selector(self.makeRow7), userInfo: nil, repeats: true)
        makeRow8()
        rowTimer8 = Timer.scheduledTimer(timeInterval: TimeInterval(randomNumber(MIN: 4, MAX: 6)), target: self, selector: #selector(self.makeRow8), userInfo: nil, repeats: true)
        makeRow9()
        rowTimer9 = Timer.scheduledTimer(timeInterval: TimeInterval(randomNumber(MIN: 4, MAX: 6)), target: self, selector: #selector(self.makeRow9), userInfo: nil, repeats: true)
        makeRow10()
        rowTimer10 = Timer.scheduledTimer(timeInterval: TimeInterval(randomNumber(MIN: 4, MAX: 6)), target: self, selector: #selector(self.makeRow10), userInfo: nil, repeats: true)
        makeRow11()
        rowTimer11 = Timer.scheduledTimer(timeInterval: TimeInterval(randomNumber(MIN: 4, MAX: 6)), target: self, selector: #selector(self.makeRow11), userInfo: nil, repeats: true)
        makeRow12()
        rowTimer12 = Timer.scheduledTimer(timeInterval: TimeInterval(randomNumber(MIN: 4, MAX: 6)), target: self, selector: #selector(self.makeRow12), userInfo: nil, repeats: true)
        makeRow13()
        rowTimer13 = Timer.scheduledTimer(timeInterval: TimeInterval(randomNumber(MIN: 4, MAX: 6)), target: self, selector: #selector(self.makeRow13), userInfo: nil, repeats: true)

    }
    func killTimers()
    {
        rowTimer1.invalidate()
        rowTimer2.invalidate()
        rowTimer3.invalidate()
        rowTimer4.invalidate()
        rowTimer5.invalidate()
        rowTimer6.invalidate()
        rowTimer7.invalidate()
        rowTimer8.invalidate()
        rowTimer9.invalidate()
        rowTimer10.invalidate()
        rowTimer11.invalidate()
        rowTimer12.invalidate()
        rowTimer13.invalidate()

    }
    func reset()
    {
        removeAllChildren()
        killTimers()
        makeFrog()
        repeatRows()
        makeTopBorder()
        makeLabel(labelName: scoreLabel, labelText: "Score: \(score)", labelFontSize: 40, labelFontColor: UIColor.white, labelPosition: CGPoint(x: frame.minX+75, y: frame.minY+20))
        makeLabel(labelName: livesLabel, labelText: "Lives: \(lives)", labelFontSize: 40, labelFontColor: UIColor.white, labelPosition: CGPoint(x: frame.maxX - 75, y: frame.minY+20))
    }
    func checkWin()
    {
        if lives == 0
        {
            let gameOverAlert = UIAlertController(title: "Game Over", message: "Score: \(score)", preferredStyle: UIAlertControllerStyle.alert)
            let resetButton = UIAlertAction(title: "Restart?", style: UIAlertActionStyle.default, handler:
            {(sender) in
                self.lives = 3
                self.reset()
            })
            gameOverAlert.addAction(resetButton)
            self.view?.window?.rootViewController?.present(gameOverAlert, animated: true, completion: nil)
        }
    }
}
