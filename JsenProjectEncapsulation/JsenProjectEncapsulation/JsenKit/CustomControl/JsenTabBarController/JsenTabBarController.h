//
//  JsenTabBarController.h
//  HearstMCB
//
//  Created by WangXuesen on 15/12/13.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JsenTabBarController : UITabBarController

@property (nonatomic , strong) NSArray * controllers;
@property (nonatomic , strong) NSArray * attributes;
@property (nonatomic , assign) BOOL showPlusItem;

//配置tabbarcontroller 的属性
- (void)configAttributes:(NSArray *)attributes controllers:(NSArray *)controllers showPlusItem:(BOOL)showPlusItem;

//config bage 数目
- (void)configFirstBage:(NSString *)bageNum;
- (void)configSecondBage:(NSString *)bageNum;
- (void)configThirdBage:(NSString *)bageNum;
- (void)configFourthBage:(NSString *)bageNum;

//隐藏显示tabbar
- (void)showWithAnimation:(BOOL)animation;
- (void)hidenWithAnimation:(BOOL)animation;

@end
