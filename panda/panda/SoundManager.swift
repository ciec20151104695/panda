//
//  SoundManager.swift
//  panda
//
//  Created by s20151104695 on 2018/7/4.
//  Copyright © 2018年 s20151104695. All rights reserved.
//

import SpriteKit
import AVFoundation

class SoundManager :SKNode{
    
    var bgMusicPlayer = AVAudioPlayer()
    let jumpAct = SKAction.playSoundFileNamed("jump_from_platform.mp3", waitForCompletion: false)
    let loseAct = SKAction.playSoundFileNamed("lose.mp3", waitForCompletion: false)
    let rollAct = SKAction.playSoundFileNamed("hit_platform.mp3", waitForCompletion: false)
    let eatAct = SKAction.playSoundFileNamed("hit.mp3", waitForCompletion: false)
    
    func playBackgroundMusic(){
        let bgMusicURL:NSURL =  NSBundle.mainBundle().URLForResource("apple", withExtension: "mp3")!
        bgMusicPlayer = try! AVAudioPlayer(contentsOfURL: bgMusicURL)
        bgMusicPlayer.numberOfLoops = -1
        bgMusicPlayer.prepareToPlay()
        bgMusicPlayer.play()
    }
    func stopBackgroundMusic(){
        if bgMusicPlayer.playing{
            bgMusicPlayer.stop()
        }
    }
    
    func playDead(){
        self.runAction(loseAct)
    }
    func playJump(){
        self.runAction(jumpAct)
    }
    func playRoll(){
        self.runAction(rollAct)
    }
    func playEat(){
        self.runAction(eatAct)
    }
    
}