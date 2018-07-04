//
//  CocosViewController.swift
//  Nothing
//
//  Created by user on 2018/6/4.
//  Copyright © 2018年 user. All rights reserved.
//

import UIKit
import GLKit

class CocosViewController: UIViewController {
    
    let cocos: LuaBridge = LuaBridge.shared()
    
    var quitButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        button.backgroundColor = UIColor.orange
        button.setTitle("", for: .normal)
        button.addTarget(self, action: #selector(quitEvent), for: .touchUpInside)
        return button
    }()
    
    @objc
    func quitEvent() {
        print("test button!")
        
        self.dismiss(animated: true) {
            self.cocos.applicationEnd()
            print("Been quited!")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let eaglview = CCEAGLView.view(withFrame: self.view.bounds,
                                       pixelFormat: kEAGLColorFormatRGB565,
                                       depthFormat: GLuint(GL_DEPTH24_STENCIL8_OES),
                                       preserveBackbuffer: false, sharegroup: nil,
                                       multiSampling: false, numberOfSamples: 0)
        self.cocos.setup(with: eaglview as! CCEAGLView)
        self.view = eaglview as! UIView
        
        self.view.addSubview(quitButton)
        self.cocos.applicationRun()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
