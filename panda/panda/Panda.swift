import SpriteKit

class Panda : SKSpriteNode{
    let runAtlas = SKTextureAtlas(named: "run.atlas")
    let runFrames = [SKTexture]()
    
    init () {
    let texture = runAtlas.textureNamed("panda_run_01")
    let size = texture.size()
        super.init(texture: texture, color: UIColor.whiteColor(),size: size)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}