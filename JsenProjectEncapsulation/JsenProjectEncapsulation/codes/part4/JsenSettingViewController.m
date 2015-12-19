//
//  JsenSettingViewController.m
//  HearstMCB
//
//  Created by WangXuesen on 15/12/11.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import "JsenSettingViewController.h"
#import "UINavigationBar+Expansion.h"
#import "JsenTitleView.h"
#import "JsenTabBarControllerMgr.h"
#import <objc/runtime.h>
@interface JsenSettingViewController()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation JsenSettingViewController
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    JsenTitleView * view = [JsenTitleView imageName:nil imageUrl:@"http://files.b2b.cn/company/CompanyImages/2012_12/30/30121941868.jpg" title:@"hahddddddddfsdfasdfasdfasfasfda" type:JsenTitleViewTypeTitleAndImage];
    self.navigationItem.titleView = view;
    
    //items
    UIBarButtonItem * left = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStyleDone target:self action:@selector(leftItemClicked:)];
    NSArray *lefts = @[
                        left,
                        ];
    [self.navigationItem setLeftBarButtonItems:lefts animated:YES];
    
    //tableview
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    table.dataSource = self;
    table.delegate = self;
    [self.view addSubview:table];
    [table reloadData];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar jsen_setBackgroundColor:[UIColor grayColor]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar jsen_reset];
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
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 0) {
        if (offsetY >= 44) {
            [self setNavigationBarTransformProgress:1];
            [[JsenTabBarControllerMgr shareMgr] hidenWithAnimation:YES];
        } else {
            [self setNavigationBarTransformProgress:(offsetY / 44)];
        }
    } else {
        [self setNavigationBarTransformProgress:0];
        [[JsenTabBarControllerMgr shareMgr] showWithAnimation:YES];
        
    }
}

#pragma mark - Private Method
- (void)setNavigationBarTransformProgress:(CGFloat)progress
{
    [self.navigationController.navigationBar jsen_setTranslationY:(-44 * progress)];
    [self.navigationController.navigationBar jsen_setElementsAlpha:(1-progress)];
}

- (void)leftItemClicked:(UIBarButtonItem *)item {
    if (self.navigationController.viewControllers[0] != self){
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

@end
