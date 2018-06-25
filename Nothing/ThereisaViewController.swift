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

let SCREEN_TIMES:CGFloat = 64

extension ThereisaViewController: UIViewControllerTransitioningDelegate {
    
}

class ThereisaViewController: UIViewController {
    
    public var thereis: ThereIs?
    let cocos: LuaBridge = LuaBridge.shared()
    
    private var dates: [String: NODate] = [
        JUNE_03_2018:.Date(JUNE_03_2018),   //cocos2dx-lua工程添加
        MAY_17_2018:.Date(MAY_17_2018),     //添加了一个圆环进度条
        APRIL_27_2018:.Date(APRIL_27_2018), //添加了一个点击放大字的效果
    ]
    
    var cocosButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: SCREEN_TIMES, height: SCREEN_TIMES)
        button.backgroundColor = UIColor.blue
        button.setTitle("", for: .normal)
        button.addTarget(self, action: #selector(cocosViewController), for: .touchUpInside)
        return button
    }()
    
    @objc
    func cocosViewController() {
        let cocosvc = CocosViewController()
        self.present(cocosvc, animated: true) {
            print(#function)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(cocosButton)
    
        thereis = ThereIs()
        thereis?.today = dates[JUNE_03_2018]
        
        _ = thereis?
            .maybe(noDate: dates[APRIL_27_2018]!,{
            self.view.addSubview(noLabel)
            }).maybe(noDate: dates[MAY_17_2018]!, {
                self.view.addSubview(circle)
            })
        

        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
    }
    public lazy var circle: CircleView = {
        let frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        let circle = CircleView.init(frame: frame)
        return circle
    }()
    
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
    
    func gameScene() {
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

extension ThereisaViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        //
        _ = thereis?
            .maybe(noDate: dates[APRIL_27_2018]!, {
                self.noLabel.appear()
            })
            .maybe(noDate: dates[MAY_17_2018]!, {
//                self.circle.layerHidden(hidden: false)
                self.circle.animationLayer?.isHidden = false
                self.circle.startAnimation(totalTime: 10)
            })
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        _ = thereis?
            .maybe(noDate: dates[APRIL_27_2018]!,{
                guard touches.count < 2 else {
                    return
                }
                
                let point = touches.first?.location(in: self.view)
                self.noLabel.center = point!
            })

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        _ = thereis?
            .maybe(noDate: dates[APRIL_27_2018]!,{
                self.noLabel.disappear()
            })
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        _ = thereis?.maybe(noDate: dates[APRIL_27_2018]!) {
            
        }
    }
}



