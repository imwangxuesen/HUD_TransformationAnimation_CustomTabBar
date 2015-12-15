//
//  JsenTabBarItemMgr.m
//  HearstMCB
//
//  Created by WangXuesen on 15/12/14.
//  Copyright © 2015年 hearst. All rights reserved.
//
// image的宽高
static const CGFloat TabBarItem_ItemImageWH     = 22;
// image 和 title 之间的间距
static const CGFloat TabBarItem_ImageTextBorad  = 3;
// titlelabel 的高度
static const CGFloat TabBarItem_TitleH          = 10;
// bagelabel 的宽高（直径）
static const CGFloat TabBarItem_BageWH          = 14;
// bagelabel 的背景颜色
static const int     TabBarItem_BageBackgroundColor = 0xCC99090;
// bagelabel 的字体颜色
static const int     TabBarItem_BageTextColor = 0xffffff;
// bagelabel 的字号
static const NSInteger TabBarItem_BageFontSize = 9;
// bagelabel 的字体名字
#define  TabBarItem_BageFontName  @"AppleGothic"
//static const NSString * TabBarItem_BageFontName = @"AppleGothic";

#define  TabBarItem_BageFontName_PlusButtonImageName  @"img_avatar"



#import <Foundation/Foundation.h>
#import "JsenTabBarItemMgr.h"
#import "JsenTabBarItemAttribute.h"
#import "JsenTabBarItem.h"
@implementation JsenTabBarItemMgr


+ (JsenTabBarItem *)mgrTabBarItem:(JsenTabBarItemAttribute *)attribute frame:(CGRect)frame {
    JsenTabBarItem * item = [[JsenTabBarItem alloc] init];
    CGFloat buttonWidth = frame.size.width;
    CGFloat buttonHeight = frame.size.height;
    [item setFrame:CGRectMake(200, 100, buttonWidth, buttonHeight)];
    item.attribute = attribute;
    //设置title的偏移
    CGFloat titleEdgeInsetsTop = TabBarItem_ItemImageWH + TabBarItem_TitleH + TabBarItem_ImageTextBorad;
    item.titleEdgeInsets = UIEdgeInsetsMake(titleEdgeInsetsTop, -180, TabBarItem_TitleH, 0);
    
    //设置image的偏移
    CGFloat imageEdgeInsetsLeftAndRight = (buttonWidth - TabBarItem_ItemImageWH) / 2.0;
    CGFloat imageEdgeInsetsBottom = (buttonHeight - TabBarItem_ItemImageWH);
    item.imageEdgeInsets = UIEdgeInsetsMake(0, imageEdgeInsetsLeftAndRight, imageEdgeInsetsBottom , imageEdgeInsetsLeftAndRight);
    
    //设置bagelabel 的属性
    CGFloat bageRadius = TabBarItem_BageWH/2.0;
    UILabel * bageLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(item.imageView.frame) - bageRadius, -bageRadius, TabBarItem_BageWH, TabBarItem_BageWH)];
    bageLabel.backgroundColor       = UIColorFromRGB(TabBarItem_BageBackgroundColor);
    bageLabel.textAlignment         = NSTextAlignmentCenter;
    bageLabel.font                  = [UIFont fontWithName:TabBarItem_BageFontName size:TabBarItem_BageFontSize];
    bageLabel.textColor             = [UIColor whiteColor];
    bageLabel.layer.cornerRadius    = bageRadius;
    bageLabel.layer.masksToBounds   = YES;
    [item addSubview:bageLabel];
    item.bageLabel = bageLabel;
    item.bageLabel.text = @"99";
    return item;
}


+ (UIButton *)configPlusButton:(NSString *)image_nor {
    if (image_nor !=nil) {
        UIButton * plusButton = [[UIButton alloc] init];
        [plusButton setImage:[UIImage imageNamed:image_nor] forState:UIControlStateNormal];
        return plusButton;
    } else {
        
        UIButton * plusButton = [[UIButton alloc] init];
        [plusButton setImage:[UIImage imageNamed:TabBarItem_BageFontName_PlusButtonImageName] forState:UIControlStateNormal];
        return plusButton;
    }
    
}

@end
