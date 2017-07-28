//
//  NearbyActivityModel.m
//  itemplate
//
//  Created by luyunmac on 15/8/3.
//  Copyright (c) 2015年 路云开发者. All rights reserved.
//

#import "NearbyActivityModel.h"

@implementation NearbyActivityModel

+(NearbyActivityModel*)getTestData
{
    NearbyActivityModel* model = [[NearbyActivityModel alloc] init];
    model.image_array = @[
                          @"hotel_room",
                          @"icon5",
                          @"1.png",
                          @"2.png",
                          @"3.png",
                          @"4.png",
                          @"5.png",
                          @"6.png",
                          @"7.png",
                          @"8.png"
                          ];
    model.hotel_name = @"亚朵酒店";
    model.free =@"免费";
    model.title = @"周末一起HIGH翻天";
    model.distance = @"5.3km";
    model.time = @"2017年7月27日";
    model.address =@"深圳市南山区高新科技园赋安科技大厦";
    model.addressDetail =@"B座2345单元";
    model.personNum = @"响应人数6人";
    model.state = @"进行中";
    return model;
}

+(NSMutableArray*)getActivityData
{
    NSMutableArray* item = [[NSMutableArray alloc] init];
    for (int i =0 ; i<10; i++) {
        NearbyActivityModel* model = [[NearbyActivityModel alloc] init];
        model.image_array = @[
                              @"hotel_room",
                              @"icon5",
                              @"1.png",
                              @"2.png",
                              @"3.png",
                              @"4.png",
                              @"5.png",
                              @"6.png",
                              @"7.png",
                              @"8.png"
                              ];
        model.hotel_name = @"亚朵酒店";
        model.free =@"免费";
        model.title = @"周末一起HIGH翻天";
        model.distance = @"5.3km";
        model.time = @"2017年7月27日";
        model.address =@"深圳市南山区高新科技园赋安科技大厦";
        model.addressDetail =@"B座2345单元";
        model.personNum = @"响应人数6人";
        model.state = @"进行中";
        [item addObject:model];
    }

    return item;
}

+(NSMutableArray*)getActivityJoinedData
{
    NSMutableArray* item = [[NSMutableArray alloc] init];
    for (int i =0 ; i<10; i++) {
        NearbyActivityModel* model = [[NearbyActivityModel alloc] init];
        model.image_array = @[
                              @"hotel_room",
                              @"icon5",
                              @"1.png",
                              @"2.png",
                              @"3.png",
                              @"4.png",
                              @"5.png",
                              @"6.png",
                              @"7.png",
                              @"8.png"
                              ];
        model.hotel_name = @"亚朵酒店";
        model.free =@"免费";
        model.title = @"周末一起HIGH翻天";
        model.distance = @"5.3km";
        model.time = @"2015年12月24日";
        model.address =@"深圳市南山区高新科技园赋安科技大厦";
        model.addressDetail =@"B座2345单元";
        model.personNum = @"响应人数6人";
        model.state = @"进行中";
        model.isMe = true;
        [item addObject:model];
    }
    
    return item;
}


@end
