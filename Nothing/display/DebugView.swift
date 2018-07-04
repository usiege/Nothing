//
//  DebugView.swift
//  Nothing
//
//  Created by user on 2018/7/4.
//  Copyright © 2018年 user. All rights reserved.
//

import UIKit

let DebugImageWidth: CGFloat = 50

class DebugView: UIView {
    
    static let shareInstance: DebugView = {
        let frame = CGRect(x: 0, y: 200, width: DebugImageWidth, height: DebugImageWidth)
        let debugView = DebugView(frame: frame)
        return debugView
    }()
    
    fileprivate lazy var image: UIImageView = {
        let image = UIImageView.init(image: UIImage.init(named: "bang"))
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DebugView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        
        // 双击进入 debugVC
        if touch?.tapCount == 2 {
            openDebugViewControler()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        center = touches.first!.location(in: superview)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if frame.origin.x > (UIScreen.main.bounds.width - DebugImageWidth) {
            frame.origin.x = UIScreen.main.bounds.width - DebugImageWidth
        } else if frame.origin.x < 0 {
            frame.origin.x = 0
        }
        
        if frame.origin.y < 0 {
            frame.origin.y =  0
        } else if frame.origin.y > (UIScreen.main.bounds.height - DebugImageWidth) {
            frame.origin.y = UIScreen.main.bounds.height - DebugImageWidth
        }
    }
}

extension DebugView {
    fileprivate func openDebugViewControler() {
        let window = self.superview as! UIWindow
        
        let debugvc = DebugViewController()
        let nvi = UINavigationController.init(rootViewController: debugvc)
        window.rootViewController?.present(nvi, animated: true, completion:{
            self.isHidden = true
        })
    }
}
