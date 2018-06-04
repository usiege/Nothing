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

@property (strong) CCEAGLView* eaglView;

+ (instancetype)shared;
- (void)setupWithFrame:(CGRect)frame;

@end
