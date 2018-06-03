//
//  LuaBridge.m
//  Nothing
//
//  Created by user on 2018/6/1.
//  Copyright © 2018年 user. All rights reserved.
//

#import "LuaBridge.h"
#include "CocosLua.hpp"

@interface LuaBridge()
{
    CocosLua _cocosLua;
}

@end

@implementation LuaBridge

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cocosLua = CocosLua();
        
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

- (void)bridgePointer
{
    CocosLua* othercl = &_cocosLua;
    
    CocosLua* testLua;
    testLua = othercl;
    testLua = new CocosLua();
}

@end
