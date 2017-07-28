//
//  NerabyActivityCell.m
//  template
//
//  Created by chaoyuekeji on 2017/7/27.
//  Copyright © 2017年 chaoyuekeji. All rights reserved.
//

#import "NerabyActivityCell.h"
#define CELL_H 200

@implementation NerabyActivityCell
{
    TuYuNearbyActivityItem *item;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.backgroundView = nil;
        self.accessoryView = nil;
        self.selectedBackgroundView = nil;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
    
    [self initItem];
    
    return self;
}

-(void)initItem
{
    DLog(@"initItem");
    //self.backgroundColor = [UIColor redColor];
    
    item = [[TuYuNearbyActivityItem alloc] init];
    item.frame = CGRectMake(0, 0, kScreen_Width, CELL_H);
    [item initContentViews];
    [self addSubview:item];
}

-(void)setNearbyModel:(id)param
{
    DLog(@"setNearbyModel param:%@",param);
    [item setActivityNearModel:param];
}

@end
