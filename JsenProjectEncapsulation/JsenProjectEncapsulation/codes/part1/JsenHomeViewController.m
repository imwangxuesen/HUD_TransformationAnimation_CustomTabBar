//
//  JsenHomeViewController.m
//  HearstMCB
//
//  Created by WangXuesen on 15/12/11.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import "JsenHomeViewController.h"
#import "JsenTabBarControllerMgr.h"
#import "UINavigationBar+Expansion.h"
@implementation JsenHomeViewController

static int bage = 0;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 150, 30)];
    [btn setTitle:@"home加bage" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnclicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 150, 150, 30)];
    [btn1 setTitle:@"home减bage" forState:UIControlStateNormal];
    [btn1.titleLabel setTextColor:[UIColor blackColor]];
    [btn1 addTarget:self action:@selector(btn1clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 150, 30)];
    [btn2 setTitle:@"显示tabbar" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btn2clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(100, 250, 150, 30)];
    [btn3 setTitle:@"隐藏tabbar" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(btn3clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
    [self.navigationController.navigationBar jsen_setBackgroundColor:[UIColor blueColor]];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar jsen_reset];
}


- (void)btnclicked:(UIButton *)btn {
    bage++;
    [[JsenTabBarControllerMgr shareMgr] configFirstBage:[NSString stringWithFormat:@"%d",bage]];
    
}
- (void)btn1clicked:(UIButton *)btn {
    bage--;
    [[JsenTabBarControllerMgr shareMgr] configFirstBage:[NSString stringWithFormat:@"%d",bage]];
    
}
- (void)btn2clicked:(UIButton *)btn {
    
    [[JsenTabBarControllerMgr shareMgr] showWithAnimation:YES];
}

- (void)btn3clicked:(UIButton *)btn {
    [[JsenTabBarControllerMgr shareMgr] hidenWithAnimation:YES];
    
}
@end
