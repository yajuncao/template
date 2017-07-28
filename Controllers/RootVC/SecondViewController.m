//
//  SecondViewController.m
//  template
//
//  Created by chaoyuekeji on 2017/7/19.
//  Copyright © 2017年 chaoyuekeji. All rights reserved.
//

#import "SecondViewController.h"
#import "CYJCollectionViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"任务";
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 80, 100, 40)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"collection" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: btn];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)btnClicked
{
    NSLog(@"btnClicked");
    
    CYJCollectionViewController *collection = [[CYJCollectionViewController alloc] init];
    [self.navigationController pushViewController:collection animated:YES];
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
