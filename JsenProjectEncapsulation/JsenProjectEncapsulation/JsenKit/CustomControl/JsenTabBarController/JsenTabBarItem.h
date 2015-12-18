//
//  JsenTabBarItem.h
//  HearstMCB
//
//  Created by WangXuesen on 15/12/13.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JsenTabBarItemAttribute;
@interface JsenTabBarItem : UIButton

@property (nonatomic , strong) JsenTabBarItemAttribute * attribute;
@property (nonatomic , strong) UILabel                 * bageLabel;

// 配置bagelabel 的数字
- (void)configBageNum:(NSString *)bageNum;

// 是否显示bagelabel
- (void)showBage:(BOOL)showBage;
@end
