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

- (void)configAttributes:(NSArray *)attributes controllers:(NSArray *)controllers showPlusItem:(BOOL)showPlusItem;

- (void)configFirstBage:(NSString *)bageNum;
- (void)configSecondBage:(NSString *)bageNum;
- (void)configThirdBage:(NSString *)bageNum;
- (void)configFourthBage:(NSString *)bageNum;

@end
