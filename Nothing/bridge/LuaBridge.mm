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
    
    CocosLua* testLua;
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

- (void)bridgePointer
{
    CocosLua* othercl = &_cocosLua;
    
    testLua = othercl;
    testLua = new CocosLua();
}

static LuaBridge* _bridge = nil;

+ (instancetype)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _bridge = [[LuaBridge alloc] init];
    });
    return _bridge;
}

@end
