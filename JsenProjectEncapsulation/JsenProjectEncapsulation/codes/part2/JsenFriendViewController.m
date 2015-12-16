//
//  JsenFriendViewController.m
//  HearstMCB
//
//  Created by WangXuesen on 15/12/11.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import "JsenFriendViewController.h"
#import "UIImage+Expansion.h"
#import "UINavigationBar+Expansion.h"
@implementation JsenFriendViewController
- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    
    [self.navigationController.navigationBar jsen_setBackgroundColor:[UIColor purpleColor]];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar jsen_reset];
}
@end
