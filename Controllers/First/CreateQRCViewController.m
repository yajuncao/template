//
//  CreateQRCViewController.m
//  QRCode
//
//  Created by chaoyuekeji on 2017/7/17.
//  Copyright © 2017年 chaoyuekeji. All rights reserved.
//

#import "CreateQRCViewController.h"
#import "Masonry.h"

@interface CreateQRCViewController ()
@property (copy ,nonatomic) NSString * macstringData;
@property (strong ,nonatomic) UILabel *ll_mac1;
@property (strong ,nonatomic) UILabel *ll_mac2;
@property (strong ,nonatomic) UILabel *ll_mac3;
@property (strong ,nonatomic) UILabel *ll_mac4;
@end

@implementation CreateQRCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title =@"轮胎二维码";
    
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backBtnClicked)];
    [self.navigationItem setLeftBarButtonItem:temporaryBarButtonItem];

    
    self.view.backgroundColor = [UIColor cyanColor];
    
    UIImage *imgQRC = [UIImage new];
    UIImageView *imgv;
    
    _macstringData = @"800000000001810000000002820000000003830000000004";
    if (_macstringData != nil) {
        imgQRC =[CreateQRCViewController qrImageForString:_macstringData imageSize:300 logoImageSize:40];
        
        imgv = [[UIImageView alloc] initWithImage:imgQRC];
        imgv.frame = CGRectMake(([[UIScreen mainScreen] bounds].size.width -imgQRC.size.width)/2, ([[UIScreen mainScreen] bounds].size.height-60 -imgQRC.size.height)/2, imgQRC.size.width, imgQRC.size.height);
        [self.view addSubview:imgv];
    }
    
    _ll_mac1 = [[UILabel alloc] init];
    //_ll_mac1.backgroundColor = [UIColor redColor];
    _ll_mac1.frame = CGRectMake(([[UIScreen mainScreen] bounds].size.width -imgQRC.size.width)/2, imgv.frame.size.height+imgv.frame.origin.y +25, imgQRC.size.width/2-5, 40);
    _ll_mac1.text = [_macstringData substringWithRange:NSMakeRange(0, 12)];
    _ll_mac1.textColor = [UIColor blackColor];
    _ll_mac1.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_ll_mac1];
    
    _ll_mac2 = [[UILabel alloc] init];
    //_ll_mac2.backgroundColor = [UIColor redColor];
    _ll_mac2.frame = CGRectMake(_ll_mac1.frame.origin.x +_ll_mac1.frame.size.width+10, imgv.frame.size.height+imgv.frame.origin.y +25, imgQRC.size.width/2-5, 40);
    _ll_mac2.text = [_macstringData substringWithRange:NSMakeRange(12, 12)];
    _ll_mac2.textColor = [UIColor blackColor];
    _ll_mac2.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_ll_mac2];
    
    _ll_mac3 = [[UILabel alloc] init];
    //_ll_mac3.backgroundColor = [UIColor redColor];
    _ll_mac3.frame = CGRectMake(([[UIScreen mainScreen] bounds].size.width -imgQRC.size.width)/2, _ll_mac1.frame.size.height+_ll_mac1.frame.origin.y +10, imgQRC.size.width/2-5, 40);
    _ll_mac3.text = [_macstringData substringWithRange:NSMakeRange(24, 12)];
    _ll_mac3.textColor = [UIColor blackColor];
    _ll_mac3.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_ll_mac3];

    _ll_mac4 = [[UILabel alloc] init];
    //_ll_mac4.backgroundColor = [UIColor redColor];
    _ll_mac4.frame = CGRectMake(_ll_mac3.frame.origin.x +_ll_mac3.frame.size.width +10, _ll_mac2.frame.size.height+_ll_mac2.frame.origin.y +10, imgQRC.size.width/2-5, 40);
    _ll_mac4.text = [_macstringData substringWithRange:NSMakeRange(36, 12)];
    _ll_mac4.textColor = [UIColor blackColor];
    _ll_mac4.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_ll_mac4];

    // Do any additional setup after loading the view.
}

-(void)initContents:(NSString *)str
{
    NSLog(@"initContents");
    _macstringData = str;
}

-(void)backBtnClicked
{
    NSLog(@"backBtnClicked");
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"viewWillDisappear");
    //self.navigationController.navigationBar.hidden = YES;
}

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"viewDidAppear");
    self.navigationController.navigationBar.hidden = NO;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

+ (UIImage *)qrImageForString:(NSString *)string imageSize:(CGFloat)Imagesize logoImageSize:(CGFloat)waterImagesize{
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKey:@"inputMessage"];//通过kvo方式给一个字符串，生成二维码
    [filter setValue:@"H" forKey:@"inputCorrectionLevel"];//设置二维码的纠错水平，越高纠错水平越高，可以污损的范围越大
    CIImage *outPutImage = [filter outputImage];//拿到二维码图片
    return [[self alloc] createNonInterpolatedUIImageFormCIImage:outPutImage withSize:Imagesize waterImageSize:waterImagesize];
}

- (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size waterImageSize:(CGFloat)waterImagesize{
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    //创建一个DeviceGray颜色空间
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    //CGBitmapContextCreate(void * _Nullable data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef  _Nullable space, uint32_t bitmapInfo)
    //width：图片宽度像素
    //height：图片高度像素
    //bitsPerComponent：每个颜色的比特值，例如在rgba-32模式下为8
    //bitmapInfo：指定的位图应该包含一个alpha通道。
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    //创建CoreGraphics image
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef); CGImageRelease(bitmapImage);
    
    //原图
    UIImage *outputImage = [UIImage imageWithCGImage:scaledImage];
    //给二维码加 logo 图
    UIGraphicsBeginImageContextWithOptions(outputImage.size, NO, [[UIScreen mainScreen] scale]);
    [outputImage drawInRect:CGRectMake(0,0 , size, size)];
    //logo图
    UIImage *waterimage = [UIImage imageNamed:@"icon_imgApp"];
    //把logo图画到生成的二维码图片上，注意尺寸不要太大（最大不超过二维码图片的%30），太大会造成扫不出来
    [waterimage drawInRect:CGRectMake((size-waterImagesize)/2.0, (size-waterImagesize)/2.0, waterImagesize, waterImagesize)];
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newPic;
}
@end
