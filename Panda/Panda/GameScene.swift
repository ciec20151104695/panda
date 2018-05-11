
import SpriteKit
//import GameplayKit

class GameScene: SKScene {
    lazy var panda = Panda()
    override func didMove(to view: SKView) {
        let skyColor = SKColor(red:113/255,green:197/255,blue:207/255,alpha:1)
        self.backgroundColor = skyColor
        panda.position = CGPoint(x: 200, y: 400)
        self.addChild(panda)
    }
    
    
    
    
    
    
    
    
    /*   override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
     for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
     }
     
     override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
     for t in touches { self.touchUp(atPoint: t.location(in: self)) }
     }
     
     override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
     for t in touches { self.touchUp(atPoint: t.location(in: self)) }
     }
     */
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
