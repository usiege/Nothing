//
//  LuaBridge.m
//  Nothing
//
//  Created by user on 2018/6/1.
//  Copyright © 2018年 user. All rights reserved.
//

#import "LuaBridge.h"

#include "cocos2d.h"
#include "AppDelegate.h"
#include "CocosLua.hpp"


@interface LuaBridge()
{
    CocosLua _cocosLua;
    cocos2d::Application* _app;
}
@end

static AppDelegate* _cocosDelegate = nil;

@implementation LuaBridge

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cocosLua = CocosLua();
        
        //cocos2d initiatial
        _cocosDelegate = new AppDelegate();
        _app = cocos2d::Application::getInstance();
    }
    return self;
}

static LuaBridge* _bridge = nil;

+ (instancetype)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _bridge = [[LuaBridge alloc] init];
    });
    return _bridge;
}

- (void)setupWithFrame:(CGRect)frame {
    
    CCEAGLView* eaglView = [CCEAGLView viewWithFrame:frame
                                         pixelFormat:kEAGLColorFormatRGB565
                                         depthFormat:GL_DEPTH24_STENCIL8_OES
                                  preserveBackbuffer:NO
                                          sharegroup:nil
                                       multiSampling:NO
                                     numberOfSamples:0];
    cocos2d::GLView* glview = cocos2d::GLViewImpl::createWithEAGLView((__bridge void*)eaglView);
    cocos2d::Director::getInstance()->setOpenGLView(glview);

    self.eaglView = eaglView;
}

- (void)directorPause {
    cocos2d::Director::getInstance()->pause();
}

- (void)directorResume {
    cocos2d::Director::getInstance()->resume();
}

- (void)purgeCachedData {
    cocos2d::Director::getInstance()->purgeCachedData();
}

- (void)applicationRun {
    _app->run();
}

- (void)applicationDidEnterBackground {
    _app->applicationDidEnterBackground();
}

- (void)applicationWillEnterForeground {
    _app->applicationWillEnterForeground();
}

//prointer mark
- (void)bridgePointer
{
    CocosLua* othercl = &_cocosLua;
    
    CocosLua* testLua;
    testLua = othercl;
    testLua = new CocosLua();
}

@end
