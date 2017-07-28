//
//  LYGlobals.m
//  itemplate
//
//  Created by 路云开发者 on 15/6/4.
//  Copyright (c) 2015年 路云开发者. All rights reserved.
//

#import "LYGlobals.h"
#import "LYUtils.h"

@implementation LYGlobals

static LYGlobals* lyGlobals;

+(LYGlobals*)getInstance
{
    if(lyGlobals == nil){
        lyGlobals = [[LYGlobals alloc] init];
    }
    return lyGlobals;
}

-(id)init{
    return self;
}



@end
