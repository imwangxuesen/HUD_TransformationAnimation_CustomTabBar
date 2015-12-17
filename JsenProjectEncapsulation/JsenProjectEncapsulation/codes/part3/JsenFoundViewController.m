//
//  JsenFoundViewController.m
//  HearstMCB
//
//  Created by WangXuesen on 15/12/11.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import "JsenFoundViewController.h"
#import "UINavigationBar+Expansion.h"
#import "JsenSettingViewController.h"

#define NAVBAR_CHANGE_POINT 50

@interface JsenFoundViewController()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic , strong) UITableView * tableView;
@end

@implementation JsenFoundViewController
- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = nil;
    self.view.backgroundColor = [UIColor blackColor];
    
    //items
    UIBarButtonItem * right = [[UIBarButtonItem alloc] initWithTitle:@"next" style:UIBarButtonItemStyleDone target:self action:@selector(rightItemClicked:)];
    NSArray *rights = @[
                       right,
                       ];
    [self.navigationItem setRightBarButtonItems:rights animated:YES];
    
    //tableview
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, -64, self.view.bounds.size.width, self.view.bounds.size.height+ 64) style:UITableViewStyleGrouped];
    table.dataSource = self;
    table.delegate = self;
    UIImageView *headerView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, IH_DEVICE_WIDTH, 264)];
    headerView.image = [UIImage imageNamed:@"img_avatar"];
    table.tableHeaderView = headerView;
    [self.view addSubview:table];
    self.tableView = table;
    [table reloadData];
    
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tableView.delegate = self;
    [self scrollViewDidScroll:self.tableView];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar jsen_reset];
}


#pragma mark - Private Method
- (void)rightItemClicked:(UIBarButtonItem *)item {
    
    JsenSettingViewController * setting = [[JsenSettingViewController alloc] init];
    [self.navigationController pushViewController:setting animated:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"jsen"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"jsen"];
    }
    [cell.textLabel setText:[NSString stringWithFormat:@"%ld",indexPath.section]];
    return cell;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 60;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 30;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UIColor * color = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > NAVBAR_CHANGE_POINT) {
        CGFloat alpha = MIN(1, 1 - ((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64));
        [self.navigationController.navigationBar jsen_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
    } else {
        [self.navigationController.navigationBar jsen_setBackgroundColor:[color colorWithAlphaComponent:0]];
    }
}


@end
