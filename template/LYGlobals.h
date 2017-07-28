//
//  LYGlobals.h
//  itemplate
//
//  Created by 路云开发者 on 15/6/4.
//  Copyright (c) 2015年 路云开发者. All rights reserved.
//

//全局变量存在这个对象中
@interface LYGlobals : NSObject

@property (nonatomic, strong, readonly) NSString* URL_HEAD;

@property (nonatomic, strong, readonly) NSString* fileUrl;

@property (nonatomic, strong, readonly) NSString* version;
//@property (nonatomic, strong, readwrite) HLUser* loginedUser;

@property (nonatomic, strong, readwrite) NSString* token;

@property (nonatomic, assign, readwrite) float keyBoardH;

@property (nonatomic, assign, readwrite) float keyBoardY;

@property (nonatomic, strong) NSMutableDictionary* userRooms;

@property (nonatomic, strong, readwrite) NSString* remember_user_key;

@property (nonatomic, strong, readwrite) NSString* users_location_key;

+(LYGlobals*)getInstance;
//用于登出后重置所有全局变量
@end

