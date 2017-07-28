//
//  UIFactory.h
//  itemplate
//
//  Created by 路云开发者 on 15/6/5.
//  Copyright (c) 2015年 路云开发者. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYBtnParams.h"
#import "LYLabelParams.h"
#import "LYTextFieldParams.h"

@interface LYUIFactory : NSObject

+(UIButton*)getBtnByLYBtnParams:(LYBtnParams*)btnParams;

+(UILabel*)getLabelByLYLabelParams:(LYLabelParams*)btnParams;

+(UITextField*)getTextFieldByLYTextFieldParams:(LYTextFieldParams*)btnParams;

@end
