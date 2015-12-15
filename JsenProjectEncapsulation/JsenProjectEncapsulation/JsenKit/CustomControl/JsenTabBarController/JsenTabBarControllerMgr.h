//
//  JsenTabBarControllerMgr.h
//  HearstMCB
//
//  Created by WangXuesen on 15/12/13.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JsenTabBarController.h"
@interface JsenTabBarControllerMgr : NSObject
@property (nonatomic,strong)JsenTabBarController * tabBarController;

+ (instancetype)shareMgr;

//配置attribute 目前只支持2个 或者 4个
- (JsenTabBarController *)mgrTabBarController;

//配置tabbar item 上的bage 数目
- (void)configFirstBage:(NSString *)bageNum;
- (void)configSecondBage:(NSString *)bageNum;
- (void)configThirdBage:(NSString *)bageNum;
- (void)configFourthBage:(NSString *)bageNum;

//隐藏显示tabbar
- (void)showWithAnimation:(BOOL)animation;
- (void)hidenWithAnimation:(BOOL)animation;

@end
