//
//  CreateQRCViewController.h
//  QRCode
//
//  Created by chaoyuekeji on 2017/7/17.
//  Copyright © 2017年 chaoyuekeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateQRCViewController : UIViewController

-(void)initContents:(NSString*) str;

+(UIImage *)qrImageForString:(NSString *)string imageSize:(CGFloat)Imagesize logoImageSize:(CGFloat)waterImagesize;

@end
