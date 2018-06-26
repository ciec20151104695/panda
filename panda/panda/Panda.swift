import SpriteKit

enum Status:Int{
    case run=1,jump,jump2,roll;
}


class Panda : SKSpriteNode{
    let runAtlas = SKTextureAtlas(named: "run.atlas")
    let runFrames = [SKTexture]()
    
    var status = Status.run
    
    init () {
    let texture = runAtlas.textureNamed("panda_run_01")
    let size = texture.size()
        super.init(texture: texture, color: UIColor.whiteColor(),size: size)
        
        var i:Int
        //填充跑的纹理数组
        for i=1 ; i<=runAtlas.textureNames.count ; i += 1 {
            let tempName = String(format: "panda_run_%.2d", i)
            let runTexture = runAtlas.textureNamed(tempName)
            if runTexture  {
            runFrames.append(runTexture)
            }
        }
        
    }
    
    func run(){
        //移除所有的动作
        self.removeAllActions()
        //将当前动作状态设为跑
        self.status = .run
        //通过SKAction.animateWithTextures将跑的文理数组设置为0.05秒切换一次的动画
        // SKAction.repeatActionForever将让动画永远执行
        // self.runAction执行动作形成动画
        self.runAction(SKAction.repeatActionForever(
            SKAction.animateWithTextures(runFrames, timePerFrame: 0.05)))
    }

    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}