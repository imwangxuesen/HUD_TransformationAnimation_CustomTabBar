//
//  JsenTabBarControllerMgr.m
//  HearstMCB
//
//  Created by WangXuesen on 15/12/13.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import "JsenTabBarControllerMgr.h"

#import "JsenHomeViewController.h"
#import "JsenFriendViewController.h"
#import "JsenFoundViewController.h"
#import "JsenSettingViewController.h"

#import "JsenTabBarItemAttribute.h"

@implementation JsenTabBarControllerMgr

+(instancetype)shareMgr
{
    static JsenTabBarControllerMgr *instance ;
    
    //dispatch_once_t是线程安全的，onceToken默认为0
    static dispatch_once_t onceToken;
    
    //dispatch_once宏可以保证块代码中的指令只被执行一次
    dispatch_once (&onceToken,^{
        instance = [[JsenTabBarControllerMgr alloc] init];
    });
    return instance;
}

- (JsenTabBarController *)mgrTabBarController {
    
    //配置attribute 目前只支持2个 或者 4个
    JsenTabBarItemAttribute * homeAttribute = [[JsenTabBarItemAttribute alloc] initWithTitle:@"首页" imageNameForSel:@"tab_home_sel" imageNameForNor:@"tab_home_nor"];
    JsenTabBarItemAttribute * friendAttribute = [[JsenTabBarItemAttribute alloc] initWithTitle:@"朋友" imageNameForSel:@"tab_friend_sel" imageNameForNor:@"tab_friend_nor"];
    JsenTabBarItemAttribute * foundAttribute = [[JsenTabBarItemAttribute alloc] initWithTitle:@"发现" imageNameForSel:@"tab_found_sel" imageNameForNor:@"tab_found_nor"];
    JsenTabBarItemAttribute * settingAttribute = [[JsenTabBarItemAttribute alloc] initWithTitle:@"设置" imageNameForSel:@"tab_setting_sel" imageNameForNor:@"tab_setting_nor"];
    NSArray * attributes = @[
                             homeAttribute,
                             friendAttribute,
                             foundAttribute,
                             settingAttribute,
                             ];
    
    JsenHomeViewController * home = [[JsenHomeViewController alloc] init];
    home.title = @"首页";
    
    JsenFriendViewController * friend = [[JsenFriendViewController alloc] init];
    friend.title = @"朋友";
    
    JsenFoundViewController * found = [[JsenFoundViewController alloc] init];
    found.title = @"发现";
    
    JsenSettingViewController * setting = [[JsenSettingViewController alloc] init];
    setting.title = @"设置";
    
    NSArray * controllers = @[
                              home,
                              friend,
                              found,
                              setting,
                              ];
    
    JsenTabBarController * tabBar = [[JsenTabBarController alloc] init];
    [tabBar configAttributes:attributes controllers:controllers showPlusItem:YES];
    self.tabBarController = tabBar;
    return self.tabBarController;
}

#pragma mark - Config Page Number
- (void)configFirstBage:(NSString *)bageNum {
    [self.tabBarController configFirstBage:bageNum];
}

- (void)configSecondBage:(NSString *)bageNum {
    [self.tabBarController configSecondBage:bageNum];
}

- (void)configThirdBage:(NSString *)bageNum {
    [self.tabBarController configThirdBage:bageNum];
}

- (void)configFourthBage:(NSString *)bageNum {
    [self.tabBarController configFourthBage:bageNum];
}

@end
