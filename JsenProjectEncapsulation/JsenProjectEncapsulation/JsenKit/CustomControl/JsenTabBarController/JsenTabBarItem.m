//
//  JsenTabBarItem.m
//  HearstMCB
//
//  Created by WangXuesen on 15/12/13.
//  Copyright © 2015年 hearst. All rights reserved.
//

// title 字号大小
static const NSInteger TabBarItem_TitleFontSize = 10;
// 按钮的背景颜色
static const int   TabBarItem_BackgroundColor = 0xFFFFCC;
// 标题的背景颜色
static const int   TabBarItem_TitleBackgroundColor = 0xffffff;
// 正常状态下标题的颜色
static const int   TabBarItem_TitleTextColor_Nor = 0xDC143C;
// 选中状态下的标题颜色
static const int   TabBarItem_TitleTextColor_Sel = 0x000000;
// 高亮状态下的标题颜色
static const int   TabBarItem_TitleTextColor_HL = 0xe4dede;

#import "JsenTabBarItem.h"
#import "JsenTabBarItemAttribute.h"
#import "JsenValidationKit.h"
@implementation JsenTabBarItem
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)setAttribute:(JsenTabBarItemAttribute *)attribute {
    _attribute = attribute;
    [self setTitle:attribute.title forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:attribute.imageNameForNor] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:attribute.imageNameForSel] forState:UIControlStateSelected];
    [self setBackgroundColor:UIColorFromRGB(TabBarItem_BackgroundColor)];
    [self setTitleColor:UIColorFromRGB(TabBarItem_TitleTextColor_Nor) forState:UIControlStateNormal];
    [self setTitleColor:UIColorFromRGB(TabBarItem_TitleTextColor_HL) forState:UIControlStateHighlighted];
    [self.titleLabel setFont:[UIFont fontWithName:@"AppleGothic" size:TabBarItem_TitleFontSize]];
    

}


- (void)configBageNum:(NSString *)bageNum {
    BOOL hidenBage = [JsenValidationKit isValueEmpty:bageNum] || [bageNum intValue] == 0;
    hidenBage ? [self showBage:NO] : [self.bageLabel setText:bageNum];
    
}
- (void)showBage:(BOOL)showBage {
    self.bageLabel.hidden = !showBage;
    
}


@end


