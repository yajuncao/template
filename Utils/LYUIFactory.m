//
//  UIFactory.m
//  itemplate
//
//  Created by 路云开发者 on 15/6/5.
//  Copyright (c) 2015年 路云开发者. All rights reserved.
//

#import "LYUIFactory.h"
#import "LYBtnParams.h"
#import "LYLabelParams.h"
#import "LYTextFieldParams.h"

@implementation LYUIFactory

+(UIButton*)getBtnByLYBtnParams:(LYBtnParams*)btnParams
{
    UIButton* btn = [[UIButton alloc] initWithFrame:btnParams.btnRect];
    if(btnParams.touchUpInside != nil){
        DLog(@"add touch up inside");
        [btn addTarget:btnParams.target action:btnParams.touchUpInside forControlEvents:UIControlEventTouchUpInside];
    }
    if(btnParams.touchUpOutside != nil){
        [btn addTarget:btnParams.target action:btnParams.touchUpOutside forControlEvents:UIControlEventTouchUpOutside];
    }
    if(btnParams.touchDown != nil){
        [btn addTarget:btnParams.target action:btnParams.touchDown forControlEvents:UIControlEventTouchDown];
    }
    if(btnParams.touchCancel != nil){
        [btn addTarget:btnParams.target action:btnParams.touchDown forControlEvents:UIControlEventTouchCancel];
    }
    if(btnParams.normalImage != nil){
        [btn setImage:[UIImage imageNamed:btnParams.normalImage] forState:UIControlStateNormal];
    }
    if(btnParams.highlightImage != nil){
        [btn setImage:[UIImage imageNamed:btnParams.highlightImage] forState:UIControlStateHighlighted];
    }
    if(btnParams.backGroundColor != nil){
        btn.backgroundColor = btnParams.backGroundColor;
    }
    //    if(btnParams.text != nil){
    //        btn.titleLabel.text = btnParams.text;
    //    }
    //    if(btnParams.textColor != nil){
    //        btn.titleLabel.textColor = btnParams.textColor;
    //    }
    //    if(btnParams.font != nil){
    //        btn.titleLabel.font = btnParams.font;
    //    }
    if(btnParams.btnIamge != nil){
        [btn setImage:[UIImage imageNamed:btnParams.btnIamge] forState:UIControlStateNormal ];
    }
    if(btnParams.cornerRadius != 0){
        btn.layer.cornerRadius = btnParams.cornerRadius;
        btn.layer.masksToBounds = YES;
    }
    if(btnParams.borderWidth != 0){
        btn.layer.borderWidth = btnParams.borderWidth;
    }
    if(btnParams.borderColor != nil){
        btn.layer.borderColor = btnParams.borderColor.CGColor;
    }
    if(btnParams.opacity != 0){
        btn.layer.opacity = btnParams.opacity;
    }
    if(btnParams.text != nil){
        [btn setTitle:btnParams.text forState: UIControlStateNormal];
        DLog(@"text align:%d", btnParams.aligin);
        btn.contentHorizontalAlignment = btnParams.aligin;
        //设置按钮上的自体的大小
        if(btnParams.fontSize == 0){
            if(btnParams.isBold){
                btn.titleLabel.font = [UIFont boldSystemFontOfSize:14.0];
            }else{
                btn.titleLabel.font = [UIFont systemFontOfSize:14.0];
            }
        }else{
            if(btnParams.isBold){
                btn.titleLabel.font = [UIFont boldSystemFontOfSize:btnParams.fontSize];
            }else{
                btn.titleLabel.font = [UIFont systemFontOfSize:btnParams.fontSize];
            }
        }
        if(btnParams.fontColor != nil){
            [btn setTitleColor:btnParams.fontColor forState:UIControlStateNormal];
        }else{
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    }
    return btn;
}

+(UILabel*)getLabelByLYLabelParams:(LYLabelParams*)labelParams
{
    
    UILabel* label = [[UILabel alloc] initWithFrame:labelParams.labelRect];
    [label setText:labelParams.text];
    if(labelParams.bold){
        label.font = [UIFont boldSystemFontOfSize:labelParams.fontSize];
    }else{
        label.font = [UIFont systemFontOfSize:labelParams.fontSize];
    }
    if(labelParams.fontName != nil){
        DLog(@"设置字体%@", labelParams.fontName);
        label.font = [UIFont fontWithName:labelParams.fontName size:labelParams.fontSize];
    }
    if(labelParams.textColor != nil){
        DLog(@"set title black color");
        label.textColor = labelParams.textColor;
    }else{
        label.textColor = [UIColor blackColor];
    }
    label.textAlignment = labelParams.textAlign;
    label.adjustsFontSizeToFitWidth = labelParams.adjustsFontSizeToFitWidth;
    label.numberOfLines = labelParams.numberOfLines;
    if(labelParams.backgroundColor != nil){
        label.backgroundColor = labelParams.backgroundColor;
    }
    if(labelParams.highlightedTextColor != nil){
        label.highlighted = labelParams.highlighted;
        label.highlightedTextColor = labelParams.highlightedTextColor;
    }
    return label;
}

+(UITextField*)getTextFieldByLYTextFieldParams:(LYTextFieldParams*)btnParams
{
    UITextField* textField = [[UITextField alloc] initWithFrame:btnParams.textFieldRect];
    if(btnParams.textColor!=nil)
    {
        textField.textColor = btnParams.textColor;
    }
    if(btnParams.text!=nil)
    {
        textField.text = btnParams.text;
    }
    if(btnParams.bold)
    {
        textField.font= [UIFont boldSystemFontOfSize:btnParams.fontSize];
    }else{
        textField.font= [UIFont systemFontOfSize:btnParams.fontSize];
    }
    if(btnParams.placeholder!=nil)
    {
        textField.placeholder = btnParams.placeholder;
    }
    if(btnParams.keyboardType!=nil)
    {
        textField.keyboardType = btnParams.keyboardType;
    }
    if(btnParams.keyboardAppearance!=nil)
    {
        textField.keyboardAppearance = btnParams.keyboardAppearance;
    }
    
    if(btnParams.secureTextEntry!=nil)
    {
        textField.secureTextEntry = btnParams.secureTextEntry;
    }
    
    if(btnParams.borderStyle!=nil)
    {
        textField.borderStyle = btnParams.borderStyle;
    }
    
    return textField;
}

@end
