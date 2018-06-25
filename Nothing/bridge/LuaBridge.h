//
//  LuaBridge.h
//  Nothing
//
//  Created by user on 2018/6/1.
//  Copyright © 2018年 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "platform/ios/CCEAGLView-ios.h"

@interface LuaBridge : NSObject

+ (instancetype)shared;

@property (strong) EAGLContext* context;
@property (strong) CCEAGLView* eaglView;

- (void)setupWithFrame:(CGRect)frame;
- (void)setupWithEAGLView:(CCEAGLView *)eaglView;

//Director
- (void)directorPause;
- (void)directorResume;
- (void)purgeCachedData;

//application
- (void)applicationRun;
- (void)applicationEnd;
- (void)applicationDidEnterBackground;
- (void)applicationWillEnterForeground;


@end
