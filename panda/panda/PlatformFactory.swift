import SpriteKit

class PlatformFactory:SKNode {
    let textureLeft = SKTexture(imageNamed: "platform_l")
    let textureMid = SKTexture(imageNamed: "platform_m")
    let textureRight = SKTexture(imageNamed: "platform_r")
    
    
    func createPlatform(midNum:UInt32,x:CGFloat,y:CGFloat){
        let platform = Platform()
        let platform_left = SKSpriteNode(texture: textureLeft)
        platform_left.anchorPoint = CGPointMake(0, 0.9)
        
        let platform_right = SKSpriteNode(texture: textureRight)
        platform_right.anchorPoint = CGPointMake(0, 0.9)
        
        var arrPlatform = [SKSpriteNode]()
        
        arrPlatform.append(platform_left)
        platform.position = CGPointMake(x, y)
        
        for _ in 1...midNum {
            let platform_mid = SKSpriteNode(texture: textureMid)
            platform_mid.anchorPoint = CGPointMake(0, 0.9)
            arrPlatform.append(platform_mid)
        }
        arrPlatform.append(platform_right)
        platform.onCreate(arrPlatform)
        platform.name = "platform"
        self.addChild(platform)
        
  //      platforms.append(platform)
   //     self.delegate?.onGetData(platform.width + x - screenWdith,theY:y)
    }
}