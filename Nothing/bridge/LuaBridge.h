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
@property (strong) CCEAGLView* eaglView;
- (void)setupWithFrame:(CGRect)frame;

//Director
- (void)directorPause;
- (void)directorResume;
- (void)purgeCachedData;

//application
- (void)applicationRun;
- (void)applicationDidEnterBackground;
- (void)applicationWillEnterForeground;


@end
