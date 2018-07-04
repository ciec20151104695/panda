

import SpriteKit

class GameScene: SKScene,SKPhysicsContactDelegate ,ProtocolMainscreen{
    lazy var panda  = Panda()
    lazy var platformFactory = PlatformFactory()
    //移动速度
    lazy var sound = SoundManager()
    lazy var bg = Background()
    lazy var appleFactory = AppleFactory()
    let scoreLab = SKLabelNode(fontNamed:"Chalkduster")
    let appLab = SKLabelNode(fontNamed:"Chalkduster")
    let myLabel = SKLabelNode(fontNamed:"Chalkduster")
    var appleNum = 0
    
    
    var moveSpeed :CGFloat = 15.0
    var maxSpeed :CGFloat = 50.0
    var distance:CGFloat = 0.0
    var lastDis:CGFloat = 0.0
    var theY:CGFloat = 0.0
    var isLose = false
    func didBeginContact(contact: SKPhysicsContact){
        
         //熊猫和台子碰撞
        if (contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask) == (BitMaskType.platform | BitMaskType.panda){
            panda.run()
            panda.jumpEnd = panda.position.y
            if panda.jumpEnd-panda.jumpStart <= -70 {
                panda.roll()
            }
            
        }
        
    }
    
    func didEndContact(contact: SKPhysicsContact){
        panda.jumpStart = panda.position.y
        
    }
    override func didMoveToView(view: SKView) {
        
        let skyColor = SKColor(red:113/255,green:197/255,blue:207/255,alpha:1)
        self.backgroundColor = skyColor
        //背景
        self.addChild(bg)
        
        //背景z坐标
        
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVectorMake(0, -5)
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        self.physicsBody!.categoryBitMask = BitMaskType.scene
        self.physicsBody!.dynamic = false
//物理碰撞检测
        
        //给跑酷小人定一个初始位置
        panda.position = CGPointMake(200, 400)
        //将跑酷小人显示在场景中
        
        //熊猫z坐标
        
        self.addChild(panda)
        
        self.addChild(platformFactory)
        platformFactory.screenWdith = self.frame.width
        platformFactory.delegate = self
      
        platformFactory.createPlatform(3, x: 0, y: 200)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if panda.status == Status.run {
        panda.jump()
        }else if panda.status == Status.jump {
        panda.roll()
        }
        
    }
   
    override func update(currentTime: CFTimeInterval) {
   
//        if isLose {
//            
//        }else{
//            if panda.position.x < 200 {
//                let x = panda.position.x + 1
//                panda.position = CGPointMake(x, panda.position.y)
//            }
//            distance += moveSpeed
            lastDis -= moveSpeed
//            var tempSpeed = CGFloat(5 + Int(distance/2000))
//            if tempSpeed > maxSpeed {
//                tempSpeed = maxSpeed
//            }
//            if moveSpeed < tempSpeed {
//                moveSpeed = tempSpeed
//            }
//            
       
        
        
            if lastDis <= 0 {
                platformFactory.createPlatformRandom()
            }
//            distance += moveSpeed
//            scoreLab.text = "run: \(Int(distance/1000*10)/10) km"
//            appLab.text = "eat: \(appleNum) apple"
            platformFactory.move(moveSpeed)
            bg.move(moveSpeed/5)
//            appleFactory.move(moveSpeed)
        }
        
        func onGetData(dist:CGFloat,theY:CGFloat){
            
            self.lastDis = dist
 //           self.theY = theY
         //   appleFactory.theY = theY
        }

}
protocol ProtocolMainscreen {
    func onGetData(dist:CGFloat,theY:CGFloat)
}