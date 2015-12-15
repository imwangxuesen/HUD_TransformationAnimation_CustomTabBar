//
//  JsenHomeViewController.m
//  HearstMCB
//
//  Created by WangXuesen on 15/12/11.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import "JsenHomeViewController.h"
#import "JsenTabBarControllerMgr.h"
@implementation JsenHomeViewController

static int bage = 0;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 40, 30)];
    [btn setBackgroundColor:[UIColor blackColor]];
    [btn addTarget:self action:@selector(btnclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[JsenTabBarControllerMgr shareMgr] configFirstBage:@"1"];
}


- (void)btnclicked:(UIButton *)btn {
    
    [[JsenTabBarControllerMgr shareMgr] configFirstBage:[NSString stringWithFormat:@"%d",bage]];
    bage++;
}
@end
