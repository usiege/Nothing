//
//  GameViewController.swift
//  Nothing
//
//  Created by charles on 2018/6/24.
//  Copyright © 2018年 user. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    var timer : Timer?
    var displayLink : CADisplayLink?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        monsterTest();
        enterAndexit();
        timerTest();
        displayTest();
        timeRecord();
    }
    //记录时间
    var gameStartDate : Date?
    func timeRecord() {
        self.gameStartDate = Date()

        let now = Date()
        let timeSinceGameStart = now.timeIntervalSince(self.gameStartDate!)
        NSLog("The game started \(timeSinceGameStart) seconds ago")

        let hours = timeSinceGameStart / 3600.0 // 3600 seconds in an hour
        let minutes = timeSinceGameStart.truncatingRemainder(dividingBy: 3600) / 60.0 // 60 seconds in a minute
        let seconds = timeSinceGameStart.truncatingRemainder(dividingBy: 3600) / 60.0 // remaining seconds
        
        print("Time elapsed: \(hours):\(minutes):\(seconds)")
    }
    
    
    @objc
    func screenUpdated(displayLink : CADisplayLink) {
        // Update the game.
    }
    
    //CADisplayLink在每次屏幕重绘时发送消息
    func displayTest() {
    
        let screenUpdated = #selector(screenUpdated(displayLink:))
        
        displayLink = CADisplayLink(target: self, selector: screenUpdated)
        displayLink?.add(to: RunLoop.main, forMode: RunLoopMode.commonModes)

        displayLink?.isPaused = true
    
        displayLink?.invalidate()
        displayLink = nil
    }
    
    @objc
    func updateWithTimer(timer: Timer) {
        // Timer went off; update the game
        print("Timer went off!")
    }
    
    func timerTest() {
        let updateTimer = #selector(updateWithTimer(timer:))
        self.timer = Timer.scheduledTimer(timeInterval: 0.5,
                                          target: self,
                                          selector: updateTimer,
                                          userInfo: nil,
                                          repeats: true)
        //通过timeInterval可以改变定时器等待时间
        
        self.timer?.invalidate()
        self.timer = nil
    }
    
    func enterAndexit() {
        let center = NotificationCenter.default
        
        let didBecomeActive = #selector(
            UIApplicationDelegate.applicationDidBecomeActive(_:)
        )
        
        let willEnterForeground = #selector(
            UIApplicationDelegate.applicationWillEnterForeground(_:)
        )
        
        let willResignActive = #selector(
            UIApplicationDelegate.applicationWillResignActive(_:)
        )
        
        let didEnterBackground = #selector(
            UIApplicationDelegate.applicationDidEnterBackground(_:)
        )
        
        center.addObserver(self,
                           selector: didBecomeActive,
                           name: Notification.Name.UIApplicationDidBecomeActive,
                           object: nil)
        
        center.addObserver(self,
                           selector: willEnterForeground,
                           name: Notification.Name.UIApplicationWillEnterForeground,
                           object: nil)
        
        center.addObserver(self,
                           selector: willResignActive,
                           name: Notification.Name.UIApplicationWillResignActive,
                           object: nil)
        
        center.addObserver(self,
                           selector: didEnterBackground,
                           name: Notification.Name.UIApplicationDidEnterBackground,
                           object: nil)
    }
    

    func monsterTest() {
        let monster = GameObject()
        monster.add(component: DamageTaking())
        
        let damage : DamageTaking? = monster.findComponent()
        damage?.takeDamage(amount: 5)
        
        monster.update(deltaTime: 0.33)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        // Remove this object from the notification center
        NotificationCenter.default.removeObserver(self)
    }
}

extension GameViewController {
    func applicationDidBecomeActive(notification : Notification) {
        print("Application became active")
    }
    
    func applicationDidEnterBackground(notification : Notification) {
        print("Application entered background - unload textures!")
    }
    
    func applicationWillEnterForeground(notification : Notification) {
        print("Application will enter foreground - reload " +
            "any textures that were unloaded")
    }
    
    func applicationWillResignActive(notification : Notification) {
        print("Application will resign active - pause the game now!")
    }
}




