//
//  GameViewController.swift
//  Nothing
//
//  Created by user on 2018/4/26.
//  Copyright © 2018年 user. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

import CoreML

class ThereIsViewController: UIViewController {
    
    public var thereis: ThereIs?
    public var noDate: NODate?
    private var dates: [NODate] = [
        .April(APRIL_27_2018), // 0
        .April(APRIL_26_2018)
    ]

    public lazy var noLabel: UILabel = {
        let no = UILabel()
        no.bounds = CGRect(x: 0, y: 0, width: 400, height: 300)
        no.center = self.view.center
        no.backgroundColor = UIColor.clear
        
        no.text = "Nothing is everything!"
        no.textColor = UIColor.orange
        no.textAlignment = .center
        no.font = UIFont.systemFont(ofSize: 30)
        
        no.isHidden = true
        return no
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.noDate = dates[0]
        assert(self.noDate != nil, "Please set noDate for vc !")
        
        thereis = ThereIs()
        _ = thereis?.maybe(noDate: dates[0]) {
            self.view.addSubview(noLabel)
        }
        

        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        return
        if #available(iOS 10.0, *) {
            if let scene = GKScene(fileNamed: "GameScene") {
                
                // Get the SKScene from the loaded GKScene
                if let sceneNode = scene.rootNode as! GameScene? {
                    
                    // Copy gameplay related content over to the scene
                    sceneNode.entities = scene.entities
                    sceneNode.graphs = scene.graphs
                    
                    // Set the scale mode to scale to fit the window
                    sceneNode.scaleMode = .aspectFill
                    
                    // Present the scene
                    if let view = self.view as! SKView? {
                        view.presentScene(sceneNode)
                        
                        view.ignoresSiblingOrder = true
                        
                        view.showsFPS = true
                        view.showsNodeCount = true
                    }
                }
            }
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}



var start: CFTimeInterval?
var end: CFTimeInterval?
// start = CACurrentMediaTime();

extension ThereIsViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        _ = thereis?.maybe(noDate: dates[0]) {
                self.noLabel.appear()
            }
            .maybe(noDate: dates[1]) {
                
            }

    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        _ = thereis?.maybe(noDate: dates[0]) {
            guard touches.count < 2 else {
                return
            }
            let point = touches.first?.location(in: self.view)
            self.noLabel.center = point!
        }

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        _ = thereis?.maybe(noDate: dates[0]) {
            self.noLabel.disappear()
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        _ = thereis?.maybe(noDate: dates[0]) {
            
        }
    }
}



