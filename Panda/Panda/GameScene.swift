

import SpriteKit

class GameScene: SKScene {
    lazy var panda = Panda()
  
    
    
    
    override func didMoveToView(view: SKView) {
        
        let skyColor = SKColor(red:113/255,green:197/255,blue:207/255,alpha:1)
        self.backgroundColor = skyColor
        
        //给跑酷小人定一个初始位置
        panda.position = CGPointMake(200, 400)
        //将跑酷小人显示在场景中
        self.addChild(panda)
       
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if panda.status == Status.run {
        panda.jump()
        }else if panda.status == Status.jump {
        panda.roll()
        }
        
    }
   
    override func update(currentTime: CFTimeInterval) {
   
    }
}
