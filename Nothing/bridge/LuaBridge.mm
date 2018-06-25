//
//  LuaBridge.m
//  Nothing
//
//  Created by user on 2018/6/1.
//  Copyright © 2018年 user. All rights reserved.
//

#import "LuaBridge.h"

#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
#import <CoreFoundation/CoreFoundation.h>

#import "platform/ios/CCDirectorCaller-ios.h"

#include "cocos2d.h"
#include "AppDelegate.h"
#include "CocosLua.hpp"

using namespace cocos2d;

@interface LuaBridge()
{
    CocosLua _cocosLua;
    
    cocos2d::Application*   _application;
    cocos2d::Director*      _director;
    
    cocos2d::GLView*        _glview;
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
        _application = cocos2d::Application::getInstance();
        _director = cocos2d::Director::getInstance();
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

- (void)setupWithEAGLView:(CCEAGLView *)eaglView {
    
    GLView* glview = cocos2d::GLViewImpl::createWithEAGLView((__bridge void*)eaglView);
    Director::getInstance()->setOpenGLView(glview);
    
    _context = eaglView.context;
    _glview = glview;
    
    self.eaglView = eaglView;
}

- (void)setupWithFrame:(CGRect)frame {
    
    CCEAGLView* eaglView = [CCEAGLView viewWithFrame:frame
                                         pixelFormat:kEAGLColorFormatRGB565
                                         depthFormat:GL_DEPTH24_STENCIL8_OES
                                  preserveBackbuffer:NO
                                          sharegroup:nil
                                       multiSampling:NO
                                     numberOfSamples:0];
    [self setupWithEAGLView:eaglView];
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
    
    _application->run();
    
//    [[CCDirectorCaller sharedDirectorCaller] startMainLoop];
//    cocos2d::Director::getInstance()->restart();
}

- (void)applicationEnd {
    
//    _director->end();
//    _director->purgeDirectorPublic();
//    _director->setOpenGLView(nil)
//    _director->restart();
    
    _director->purgeOpenGLView();
    
    [[CCDirectorCaller sharedDirectorCaller] stopMainLoop];
    [EAGLContext setCurrentContext:nil]; 
    
    self.eaglView = nil;
    
    _context = nil;
    _glview = nil;
}

- (void)applicationDidEnterBackground {
    _application->applicationDidEnterBackground();
}

- (void)applicationWillEnterForeground {
    _application->applicationWillEnterForeground();
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
