//
//  TuYuNearbyActivityItem.m
//  itemplate
//
//  Created by luyunmac on 15/8/3.
//  Copyright (c) 2015年 路云开发者. All rights reserved.
//

#import "TuYuNearbyActivityItem.h"
#import "NearbyActivityModel.h"
//#import "TuYuActivityDetailViewController.h"
#import "AppDelegate.h"

#define TUYU_HOTEL_TITLE_H 30
#define TUYU_VIEW_PADDING 10
#define TUYU_VIEW_LEFT_PADDING 10
#define TUYU_HOTEL_TITLE_H 30


@implementation TuYuNearbyActivityItem
{
    UILabel * hotel_name;
    UIButton* delete_btn;
    UIView* lineOne;
    UIImageView* image_pic;
    UILabel* free;
    UILabel* title_label;
    UILabel* distance;
    UILabel* date_lable;
    UILabel* address_label;
    UILabel* address_detail;
    UIView* lineTwo;
    UILabel* personNum_label;
    UILabel* state;
    UIImageView* icon1;
    UIImageView* icon2;
    UIImageView* icon3;
    UIImageView* icon4;
    UIImageView* icon5;
    UIImageView* icon6;
    UIImageView* icon7;
    UIImageView* icon8;
    
    
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

-(void)onSelfClicked
{
    DLog(@"--onSelfClicked");
//    TuYuActivityDetailViewController* activity_detail = [[TuYuActivityDetailViewController alloc] init];
//    [activity_detail initContents:nil];
//    [[AppDelegate getInstance].lyNaviViewController pushViewController:activity_detail animated:YES];
}


-(void)initContentViews
{
    DLog(@"--initContentViews");
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onSelfClicked)];
    [self addGestureRecognizer:tap];
    
    hotel_name =[[UILabel alloc] initWithFrame:CGRectMake(TUYU_VIEW_LEFT_PADDING, 0, kScreen_Width-2*TUYU_VIEW_LEFT_PADDING, TUYU_HOTEL_TITLE_H)];
    hotel_name.font = [UIFont boldSystemFontOfSize:13];
    hotel_name.textColor = [UIColor redColor];
    [self addSubview:hotel_name];
    
    delete_btn =[[UIButton alloc] initWithFrame:CGRectMake(kScreen_Width-TUYU_VIEW_LEFT_PADDING -50, 3, 50, 24)];
    [delete_btn setTitle:@"删除" forState:UIControlStateNormal];
    [delete_btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    delete_btn.titleLabel.font = [UIFont boldSystemFontOfSize:13];
    delete_btn.layer.borderColor = [UIColor greenColor].CGColor;
    delete_btn.layer.borderWidth = 0.5;
    delete_btn.layer.cornerRadius =2;
    delete_btn.hidden =true;
    [self addSubview:delete_btn];
    
    lineOne = [[UIView alloc] initWithFrame:CGRectMake(TUYU_VIEW_LEFT_PADDING, TUYU_HOTEL_TITLE_H-0.5, kScreen_Width -2*TUYU_VIEW_LEFT_PADDING, 0.5)];
    lineOne.backgroundColor =[UIColor colorWithRed:220.0/255 green:220.0/255 blue:220.0/255 alpha:0.8];
    [self addSubview:lineOne];
    
    image_pic =[[UIImageView alloc] initWithFrame:CGRectMake(TUYU_VIEW_LEFT_PADDING, TUYU_HOTEL_TITLE_H+ TUYU_VIEW_PADDING, 71, 71)];
    [self addSubview: image_pic];
    
    free =[[UILabel alloc] initWithFrame:CGRectMake(TUYU_VIEW_LEFT_PADDING+ 71+ TUYU_VIEW_LEFT_PADDING, TUYU_HOTEL_TITLE_H+ TUYU_VIEW_PADDING, 30, 20)];
    free.backgroundColor = [UIColor colorWithRed:147.0/255 green:112.0/255 blue:219.0/255 alpha:1.0];//147,112,219
    free.layer.cornerRadius = 10;
    [self addSubview: free];
    
    title_label =[[UILabel alloc] initWithFrame:CGRectMake(TUYU_VIEW_LEFT_PADDING+ 71+ TUYU_VIEW_LEFT_PADDING +30+5, TUYU_HOTEL_TITLE_H+ TUYU_VIEW_PADDING, 140, 20)];
    title_label.font = [UIFont boldSystemFontOfSize:14];
    [self addSubview: title_label];
    
    distance =[[UILabel alloc] initWithFrame:CGRectMake(kScreen_Width -TUYU_VIEW_LEFT_PADDING -50, TUYU_HOTEL_TITLE_H+ TUYU_VIEW_PADDING, 50, 20)];
    distance.font = [UIFont boldSystemFontOfSize:12];
    distance.textAlignment = NSTextAlignmentRight;
    [self addSubview: distance];
    
    date_lable =[[UILabel alloc] initWithFrame:CGRectMake(TUYU_VIEW_LEFT_PADDING+ 71+ TUYU_VIEW_LEFT_PADDING, TUYU_HOTEL_TITLE_H+ TUYU_VIEW_PADDING+ 20+2, 120, 15)];
    date_lable.font = [UIFont boldSystemFontOfSize:12];
    date_lable.textColor = [UIColor colorWithRed:192.0/255 green:192.0/255  blue:192.0/255  alpha:1.0];
    [self addSubview: date_lable];
    
    address_label =[[UILabel alloc] initWithFrame:CGRectMake(TUYU_VIEW_LEFT_PADDING+ 71+ TUYU_VIEW_LEFT_PADDING, TUYU_HOTEL_TITLE_H+ TUYU_VIEW_PADDING+ 20+2+15+2, 240, 15)];
    address_label.font = [UIFont boldSystemFontOfSize:12];
    address_label.textColor = [UIColor colorWithRed:192.0/255 green:192.0/255  blue:192.0/255  alpha:1.0];
    [self addSubview: address_label];
    
    address_detail =[[UILabel alloc] initWithFrame:CGRectMake(TUYU_VIEW_LEFT_PADDING+ 71+ TUYU_VIEW_LEFT_PADDING, TUYU_HOTEL_TITLE_H+ TUYU_VIEW_PADDING+ 20+3*2+2*15, 120, 15)];
    address_detail.font = [UIFont boldSystemFontOfSize:12];
    address_detail.textColor = [UIColor colorWithRed:192.0/255 green:192.0/255  blue:192.0/255  alpha:1.0];
    [self addSubview: address_detail];
    
    lineTwo = [[UIView alloc] initWithFrame:CGRectMake(TUYU_VIEW_LEFT_PADDING, TUYU_HOTEL_TITLE_H+ 2*TUYU_VIEW_PADDING+20+3*2+3*15-0.5, kScreen_Width -2*TUYU_VIEW_LEFT_PADDING, 0.5)];
    lineTwo.backgroundColor = [UIColor colorWithRed:220.0/255 green:220.0/255 blue:220.0/255 alpha:0.8];
    [self addSubview:lineTwo];
    
    personNum_label = [[UILabel alloc] initWithFrame:CGRectMake(TUYU_VIEW_LEFT_PADDING, TUYU_HOTEL_TITLE_H+ 2*TUYU_VIEW_PADDING +20+3*2+3*15+5, kScreen_Width - 2*TUYU_VIEW_LEFT_PADDING, 15)];
    personNum_label.font = [UIFont boldSystemFontOfSize:12];
    personNum_label.textColor = [UIColor colorWithRed:192.0/255 green:192.0/255  blue:192.0/255  alpha:1.0];
    [self addSubview: personNum_label];
    
    state = [[UILabel alloc] initWithFrame:CGRectMake(kScreen_Width - TUYU_VIEW_LEFT_PADDING -50,TUYU_HOTEL_TITLE_H+ 2*TUYU_VIEW_PADDING +20+3*2+3*15+5, 50, 15)];
    state.font = [UIFont boldSystemFontOfSize:12];
    state.textAlignment = NSTextAlignmentRight;
    state.textColor = [UIColor colorWithRed:192.0/255 green:192.0/255  blue:192.0/255  alpha:1.0];
    [self addSubview: state];
    
    icon1 = [[UIImageView alloc] initWithFrame:CGRectMake(TUYU_VIEW_LEFT_PADDING, TUYU_HOTEL_TITLE_H+ 2*TUYU_VIEW_PADDING+20+3*2+3*15+5+15+5, 34, 34)];
    [self addSubview: icon1];
    
    icon2 = [[UIImageView alloc] initWithFrame:CGRectMake(TUYU_VIEW_LEFT_PADDING + 34 + 4, TUYU_HOTEL_TITLE_H+ 2*TUYU_VIEW_PADDING+20+3*2+3*15+5+15+5, 34, 34)];
    [self addSubview: icon2];
    
    icon3 = [[UIImageView alloc] initWithFrame:CGRectMake(TUYU_VIEW_LEFT_PADDING + 2*34 + 2*4, TUYU_HOTEL_TITLE_H+ 2*TUYU_VIEW_PADDING+20+3*2+3*15+5+15+5, 34, 34)];
    [self addSubview: icon3];
    
    icon4 = [[UIImageView alloc] initWithFrame:CGRectMake(TUYU_VIEW_LEFT_PADDING + 3*34 + 3*4, TUYU_HOTEL_TITLE_H+ 2*TUYU_VIEW_PADDING+20+3*2+3*15+5+15+5, 34, 34)];
    [self addSubview: icon4];
    
    icon5 = [[UIImageView alloc] initWithFrame:CGRectMake(TUYU_VIEW_LEFT_PADDING + 4*34 + 4*4, TUYU_HOTEL_TITLE_H+ 2*TUYU_VIEW_PADDING+20+3*2+3*15+5+15+5, 34, 34)];
    [self addSubview: icon5];
    
    icon6 = [[UIImageView alloc] initWithFrame:CGRectMake(TUYU_VIEW_LEFT_PADDING + 5*34 + 5*4, TUYU_HOTEL_TITLE_H+ 2*TUYU_VIEW_PADDING+20+3*2+3*15+5+15+5, 34, 34)];
    [self addSubview: icon6];
    
    icon7 = [[UIImageView alloc] initWithFrame:CGRectMake(TUYU_VIEW_LEFT_PADDING + 6*34 + 6*4, TUYU_HOTEL_TITLE_H+ 2*TUYU_VIEW_PADDING+20+3*2+3*15+5+15+5, 34, 34)];
    [self addSubview: icon7];
    
    icon8 = [[UIImageView alloc] initWithFrame:CGRectMake(TUYU_VIEW_LEFT_PADDING + 7*34 + 7*4, TUYU_HOTEL_TITLE_H+ 2*TUYU_VIEW_PADDING+20+3*2+3*15+5+15+5, 34, 34)];
    [self addSubview: icon8];
    
    UILabel *graySpace = [[UILabel alloc] initWithFrame:CGRectMake(0, 185, kScreen_Width, 15)];
    graySpace.backgroundColor = [UIColor colorWithRed:220.0/255 green:220.0/255 blue:220.0/255 alpha:1.0];
    [self addSubview:graySpace];
}

-(void)setActivityNearModel:(NearbyActivityModel*)pModel
{
    DLog(@"--setPersonNearModel");
    
    hotel_name.text = pModel.hotel_name;
    image_pic.image =[UIImage imageNamed:[pModel.image_array objectAtIndex:0]];
    free.text =pModel.free;
    free.textColor = [UIColor whiteColor];
    free.font = [UIFont boldSystemFontOfSize:10];
    free.textAlignment = NSTextAlignmentCenter;
    free.layer.cornerRadius = 10;
    free.layer.masksToBounds = YES;
    title_label.text = pModel.title;
    distance.text = pModel.distance;
    date_lable.text = pModel.time;
    address_label.text = pModel.address;
    address_detail.text = pModel.addressDetail;
    personNum_label.text = pModel.personNum;
    state.text = pModel.state;
    
    icon1.layer.cornerRadius = 34.0/2;
    icon1.layer.masksToBounds =YES;
    [icon1 setContentMode:UIViewContentModeScaleAspectFill];
    icon1.image = [UIImage imageNamed:[pModel.image_array objectAtIndex:2]];
    
    icon2.layer.cornerRadius = 34.0/2;
    icon2.layer.masksToBounds =YES;
    [icon2 setContentMode:UIViewContentModeScaleAspectFill];
    icon2.image = [UIImage imageNamed:[pModel.image_array objectAtIndex:3]];
    
    icon3.layer.cornerRadius = 34.0/2;
    icon3.layer.masksToBounds =YES;
    [icon3 setContentMode:UIViewContentModeScaleAspectFill];
    icon3.image = [UIImage imageNamed:[pModel.image_array objectAtIndex:4]];
    
    icon4.layer.cornerRadius = 34.0/2;
    icon4.layer.masksToBounds =YES;
    [icon4 setContentMode:UIViewContentModeScaleAspectFill];
    icon4.image = [UIImage imageNamed:[pModel.image_array objectAtIndex:5]];
    
    icon5.layer.cornerRadius = 34.0/2;
    icon5.layer.masksToBounds =YES;
    [icon5 setContentMode:UIViewContentModeScaleAspectFill];
    icon5.image = [UIImage imageNamed:[pModel.image_array objectAtIndex:6]];
    
    icon6.layer.cornerRadius = 34.0/2;
    icon6.layer.masksToBounds =YES;
    [icon6 setContentMode:UIViewContentModeScaleAspectFill];
    icon6.image = [UIImage imageNamed:[pModel.image_array objectAtIndex:7]];
    
    icon7.layer.cornerRadius = 34.0/2;
    icon7.layer.masksToBounds =YES;
    [icon7 setContentMode:UIViewContentModeScaleAspectFill];
    icon7.image = [UIImage imageNamed:[pModel.image_array objectAtIndex:8]];
    
    icon8.layer.cornerRadius = 34.0/2;
    icon8.layer.masksToBounds =YES;
    [icon8 setContentMode:UIViewContentModeScaleAspectFill];
    icon8.image = [UIImage imageNamed:[pModel.image_array objectAtIndex:9]];
    
}



@end
