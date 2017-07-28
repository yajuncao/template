//
//  FirstViewController.m
//  template
//
//  Created by chaoyuekeji on 2017/7/19.
//  Copyright © 2017年 chaoyuekeji. All rights reserved.
//

#import "FirstViewController.h"
#import "QRCodeVCViewController.h"
#import "CreateQRCViewController.h"
#import "NearbyActivityViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"项目";
    
    UIButton * scanBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, 150, 45)];
    [scanBtn setBackgroundColor:[UIColor cyanColor]];
    [scanBtn setTitle:@"扫一扫" forState:UIControlStateNormal];
    [scanBtn addTarget:self action:@selector(scanBtnclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:scanBtn];
    
    UIButton * codeBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 100 +45 +10, 150, 45)];
    [codeBtn setBackgroundColor:[UIColor cyanColor]];
    [codeBtn setTitle:@"二维码" forState:UIControlStateNormal];
    [codeBtn addTarget:self action:@selector(codeBtnBtnclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:codeBtn];
    
    UIButton * nearbyBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 100 +2*45 +2*10, 150, 45)];
    [nearbyBtn setBackgroundColor:[UIColor cyanColor]];
    [nearbyBtn setTitle:@"activity" forState:UIControlStateNormal];
    [nearbyBtn addTarget:self action:@selector(nearbyBtnBtnclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nearbyBtn];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)nearbyBtnBtnclick
{
    DLog(@"nearbyBtnBtnclick");
    
    NearbyActivityViewController *activity = [[NearbyActivityViewController alloc] init];
    [activity initContents:nil];
    [self.navigationController pushViewController:activity animated:YES];
}

-(void)codeBtnBtnclick
{
    DLog(@"codeBtnBtnclick");
    CreateQRCViewController * createQRC = [[CreateQRCViewController alloc] init];
    [self.navigationController pushViewController:createQRC animated:YES];
}

-(void)scanBtnclick
{
    DLog(@"scanBtnclick")
    
    QRCodeVCViewController *scan = [[QRCodeVCViewController alloc] init];
    [self.navigationController pushViewController:scan animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    DLog(@"viewWillAppear");
}

-(void)viewWillDisappear:(BOOL)animated
{
    DLog(@"viewWillDisappear");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
