//
//  NearbyActivityViewController.m
//  template
//
//  Created by chaoyuekeji on 2017/7/27.
//  Copyright © 2017年 chaoyuekeji. All rights reserved.
//

#import "NearbyActivityViewController.h"
#import "NerabyActivityCell.h"
#define CELL_H 200

@interface NearbyActivityViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong ,nonatomic) UITableView *nearbyTable;
@property (strong ,nonatomic) NSMutableArray *dataSource;

@end

@implementation NearbyActivityViewController

//懒加载
-(NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray new];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    DLog(@"viewDidLoad");
    [super viewDidLoad];
    
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backBtnClicked)];
    [self.navigationItem setLeftBarButtonItem:temporaryBarButtonItem];
    
    self.title = @"activity";
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)backBtnClicked
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor grayColor];
    }
    return self;
}

-(void)initContents:(id)param
{
    DLog(@"initContents");
    
    //加载本地缓存数据
    _dataSource = [NearbyActivityModel getActivityData];
    //[self headerRefreshing];
    
    _nearbyTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height) style:UITableViewStylePlain];
    _nearbyTable.delegate = self;
    _nearbyTable.dataSource = self;
    //_nearbyTable.backgroundColor = [UIColor grayColor];
    _nearbyTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_nearbyTable];
    
    //header 刷新
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefreshing)];
    header.automaticallyChangeAlpha = YES;
    header.lastUpdatedTimeLabel.hidden = NO;
    _nearbyTable.mj_header = header;
    
    //footer 加载
    _nearbyTable.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefreshing)];
    _nearbyTable.mj_footer.ignoredScrollViewContentInsetBottom = 30;
    _nearbyTable.contentInset = UIEdgeInsetsMake(0, 0, 30, 0);
    
    //刷新最新的后台数据
    [self headerRefreshing];
}

-(void)headerRefreshing
{
    //每次拿后台最新的十条数据
    DLog(@"headerRefreshing");
    
    [_dataSource removeAllObjects];
    [self loadData];
}

-(void)footerRefreshing
{
    //每次按页拿数据
    DLog(@"footerRefreshing");
    [self loadData];
}

-(void)loadData
{
    DLog(@"loadData");
    NSMutableArray *data = [NearbyActivityModel getActivityData];
    [data enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj) {
            [_dataSource addObject:obj];
        };
    }];
    
    DLog(@"_dataSource:%d",_dataSource.count)
    
    [_nearbyTable.mj_header endRefreshing];
    [_nearbyTable.mj_footer endRefreshing];
    [_nearbyTable reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return 5;
    return _dataSource.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CELL_H;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NerabyActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([NerabyActivityCell class])];
    
    if (!cell) {
        cell = [[NerabyActivityCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([NerabyActivityCell class])];
    }
    [cell setNearbyModel:_dataSource[indexPath.row]];
    
    return cell;
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
