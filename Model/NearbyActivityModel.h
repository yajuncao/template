//
//  NearbyActivityModel.h
//  itemplate
//
//  Created by luyunmac on 15/8/3.
//  Copyright (c) 2015年 路云开发者. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NearbyActivityModel : NSObject

@property (nonatomic, strong) NSMutableArray * image_array;
@property (nonatomic, strong) NSString *hotel_name;
@property (nonatomic, strong) NSString *free;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *distance;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *addressDetail;
@property (nonatomic, strong) NSString *personNum;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, assign) bool  isMe;

+(NearbyActivityModel*)getTestData;

+(NSMutableArray*)getActivityData;

+(NSMutableArray*)getActivityJoinedData;

@end
