//
//  AppleFactory.swift
//  panda
//
//  Created by s20151104695 on 2018/7/4.
//  Copyright © 2018年 s20151104695. All rights reserved.
//

import SpriteKit

class AppleFactory:SKNode{
    let appleTexture = SKTexture(imageNamed: "apple")
    var sceneWidth:CGFloat = 0.0
    var arrApple = [SKSpriteNode]()
    var timer = NSTimer()
    var theY:CGFloat = 0.0
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func onInit(width:CGFloat, y:CGFloat) {
        
        self.sceneWidth = width
        self.theY = y
        timer = NSTimer.scheduledTimerWithTimeInterval( 0.2, target: self, selector: #selector(AppleFactory.createApple), userInfo: nil, repeats: true)
    }
    func createApple(){
        let random = arc4random() % 10
        if random > 8 {
            let apple = SKSpriteNode(texture: appleTexture)
            apple.physicsBody = SKPhysicsBody(rectangleOfSize: apple.size)
            apple.physicsBody!.restitution = 0
            apple.physicsBody!.categoryBitMask = BitMaskType.apple
            apple.physicsBody!.dynamic = false
            apple.anchorPoint = CGPointMake(0, 0)
            apple.zPosition = 40
            apple.position  = CGPointMake(sceneWidth+apple.frame.width , theY + 150)
            arrApple.append(apple)
            self.addChild(apple)
        }
        
    }
    func move(speed:CGFloat){
        for apple in arrApple {
            apple.position.x -= speed
        }
        if arrApple.count > 0 && arrApple[0].position.x < -20{
            
            arrApple[0].removeFromParent()
            arrApple.removeAtIndex(0)
            
        }
        
    }
    func reSet(){
        self.removeAllChildren()
        arrApple.removeAll(keepCapacity: false)
    }
}
