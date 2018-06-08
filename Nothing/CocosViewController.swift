//
//  CocosViewController.swift
//  Nothing
//
//  Created by user on 2018/6/4.
//  Copyright © 2018年 user. All rights reserved.
//

import UIKit

class CocosViewController: UIViewController {

    var quitButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        button.backgroundColor = UIColor.orange
        button.setTitle("", for: .normal)
        button.addTarget(self, action: #selector(quitViewController), for: .touchUpInside)
        return button
    }()
    
    @objc
    func quitViewController() {
        self.dismiss(animated: true) {
            print(#function)
        }
    }
    
    var cocos: LuaBridge?
    func setupCocos() {
        let ocbridge = LuaBridge.shared();
        ocbridge?.setup(withFrame: self.view.bounds)
        
        self.cocos = ocbridge
        self.view = cocos?.eaglView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupCocos()
        self.view.addSubview(quitButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
