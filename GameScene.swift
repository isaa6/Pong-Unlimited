//
//  GameScene.swift
//  Pong Unlimited!
//
//  Created by Isaac Marovitz on 06/08/2017.
//  Copyright © 2017 Isaac Marovitz. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let fadeOut = SKAction.fadeOut(withDuration:2)
    let fadeIn = SKAction.fadeIn(withDuration: 2)
    
    override func didMove(to view: SKView) {
        
        let startScreen = SKSpriteNode()
        startScreen.self.childNode(withName: "startScreen")
        
        startScreen.run(fadeOut) {
            startScreen.texture = SKTexture(imageNamed:"pong")
        }
        
        startScreen.run(fadeIn)
        
        startScreen.run(fadeOut) {
            startScreen.alpha = 0.0
            startScreen.zPosition = -2
        }
        
        let Ball = SKSpriteNode()
        Ball.self.childNode(withName: "Ball")
        
        let playerPaddle = SKSpriteNode()
        playerPaddle.self.childNode(withName: "playerPaddle")
        
        let computerPaddle = SKSpriteNode()
        computerPaddle.self.childNode(withName: "computerPaddle")
        
        let ballCategory: UInt32 = 0x1 << 1
        let paddleCategory: UInt32 = 0x1 << 2
        let borderCategory: UInt32 = 0x1 << 3
        
        Ball.physicsBody?.categoryBitMask = ballCategory
        playerPaddle.physicsBody?.categoryBitMask = paddleCategory
        computerPaddle.physicsBody?.categoryBitMask = paddleCategory
        self.physicsBody?.categoryBitMask = borderCategory
        
        let playerScore = SKLabelNode()
        playerScore.fontName = "Pong Score"
        playerScore.text = "0"
        playerScore.fontSize = 100
        playerScore.color = SKColor.white
        playerScore.position = CGPoint(x: -200, y: 220)
        playerScore.zPosition = 3
        addChild(playerScore)
        
        let comScore = SKLabelNode()
        comScore.fontName = "Pong Score"
        comScore.text = "0"
        comScore.fontSize = 100
        comScore.color = SKColor.white
        comScore.position = CGPoint(x: 200, y: 220)
        comScore.zPosition = 3
        addChild(comScore)
        
        var comScoreInt: Int = Int(comScore.text!)!
        comScoreInt += 1
        comScore.text = String(comScoreInt)
        
        var playerScoreInt: Int = Int(playerScore.text!)!
        playerScoreInt += 1
        playerScore.text = String(playerScoreInt)
        
        let bodyBorder = SKPhysicsBody(edgeLoopFrom: self.frame)
        bodyBorder.friction = 0
        bodyBorder.restitution = 1
        self.physicsBody = bodyBorder
    }
}
