//
//  RootVCViewController.m
//  template
//
//  Created by chaoyuekeji on 2017/7/19.
//  Copyright © 2017年 chaoyuekeji. All rights reserved.
//

#import "RootVCViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"

@interface RootVCViewController ()///<>

@end

@implementation RootVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)addChildVc:(UIViewController*)childVc title:(NSString*)title image:(NSString*)image selectdeImage:(NSString*)selectedImage
{
    childVc.tabBarItem.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    childVc.view.backgroundColor = [UIColor whiteColor];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    //nav.delegate = self;
    //[self navigationController:nav willShowViewController:childVc animated:YES];
    [self addChildViewController:nav];
}
-(instancetype)init
{
    self = [super init];
    if (self) {
        [self viewWillAppear:YES];
        [self addChildVC];
    }
    return self;
}

-(void)addChildVC
{
    FirstViewController *one = [[FirstViewController alloc] init];
    [self addChildVc:one title:@"项目" image:@"project_normal" selectdeImage:@"project_selected"];
    
    SecondViewController *two = [[SecondViewController alloc] init];
    [self addChildVc:two title:@"任务" image:@"task_normal" selectdeImage:@"task_selected"];
    
    ThirdViewController *three = [[ThirdViewController alloc] init];
    [self addChildVc:three title:@"冒泡" image:@"tweet_normal" selectdeImage:@"tweet_selected"];
    
    FourthViewController *four = [[FourthViewController alloc] init];
    [self addChildVc:four title:@"消息" image:@"privatemessage_normal" selectdeImage:@"privatemessage_selected"];
    
    FifthViewController *five = [[FifthViewController alloc] init];
    [self addChildVc:five title:@"我" image:@"me_normal" selectdeImage:@"me_selected"];
}

-(void)viewWillAppear:(BOOL)animated
{
    DLog(@"------navi1");
    [super viewWillAppear:animated];
    
    [self.selectedViewController viewWillAppear:animated];  //tabbarController直接用selectedViewController更方便
}

/*
-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    DLog(@"------navi");
    static UIViewController *lastController = nil; //若上个view不为空
    if (lastController != nil) { //若该实例实现了viewWillDisappear方法，则调用
        if ([lastController respondsToSelector:@selector(viewWillDisappear:)]) { [lastController viewWillDisappear:animated]; }
    } //将当前要显示的view设置为lastController，在下次view切换调用本方法时，会执行viewWillDisappear
    lastController = viewController;
    [viewController viewWillAppear:animated];
}
*/
@end
