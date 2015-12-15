//
//  JsenTabBarItemMgr.m
//  HearstMCB
//
//  Created by WangXuesen on 15/12/14.
//  Copyright © 2015年 hearst. All rights reserved.
//




#import <Foundation/Foundation.h>
#import "JsenTabBarItemMgr.h"
#import "JsenTabBarItemAttribute.h"
#import "JsenTabBarItem.h"
#import "JsenTabBarConfig.h"
@implementation JsenTabBarItemMgr


+ (JsenTabBarItem *)mgrTabBarItem:(JsenTabBarItemAttribute *)attribute frame:(CGRect)frame tag:(NSInteger)tag {
    JsenTabBarItem * item = [[JsenTabBarItem alloc] init];
<<<<<<< HEAD
    CGFloat buttonWidth  = frame.size.width;
    CGFloat buttonHeight = frame.size.height;
    [item setFrame:CGRectMake(200, 100, buttonWidth, buttonHeight)];
    item.attribute = attribute;
    
    //设置title的偏移
    CGFloat titleEdgeInsetsTop = TabBarItem_ItemImageWH + TabBarItem_TitleH + TabBarItem_ImageTextBorad;
    item.titleEdgeInsets = UIEdgeInsetsMake(titleEdgeInsetsTop, -180, TabBarItem_TitleH, 0);
    
    //设置image的偏移
    CGFloat imageEdgeInsetsLeftAndRight = (buttonWidth - TabBarItem_ItemImageWH) / 2.0;
    CGFloat imageEdgeInsetsBottom       = (buttonHeight - TabBarItem_ItemImageWH);
    item.imageEdgeInsets = UIEdgeInsetsMake(0, imageEdgeInsetsLeftAndRight, imageEdgeInsetsBottom , imageEdgeInsetsLeftAndRight);
    
    //设置bagelabel 的属性
    CGFloat bageRadius  = TabBarItem_BageWH/2.0;
    UILabel * bageLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(item.imageView.frame) - bageRadius, -bageRadius, TabBarItem_BageWH, TabBarItem_BageWH)];
=======
    CGFloat buttonWidth = frame.size.width;
    [item setFrame:frame];
    item.attribute = attribute;
    item.tag = tag;
    
    CGFloat imageX = item.imageView.frame.origin.x;
    CGFloat imageY = item.imageView.frame.origin.y;
    CGFloat imageW = item.imageView.image.size.width;
    CGFloat labelW = item.titleLabel.frame.size.width;
    
    //设置imge的偏移
    [item.imageView setContentMode:UIViewContentModeCenter];
    [item.titleLabel setContentMode:UIViewContentModeCenter];
    CGFloat imageEdgeInsetsTop  = imageY > 5 ? 5-imageY : imageY;
    CGFloat imageEdgeInsetsLeft = (buttonWidth-imageW-imageX)/2;
    [item setImageEdgeInsets:UIEdgeInsetsMake(imageEdgeInsetsTop, imageEdgeInsetsLeft, 0.f, 0.f)];
    
    //设置label的偏移
    CGFloat labelEdgeInsetsTop  = CGRectGetMaxY(item.imageView.frame);
    CGFloat labelEdgeInsetsLeft = -item.titleLabel.center.x + (buttonWidth-labelW)/2;
    [item setTitleEdgeInsets:UIEdgeInsetsMake(labelEdgeInsetsTop, labelEdgeInsetsLeft, 0.f, 0.f)];
    
    //设置bagelabel 的属性
    CGFloat bageRadius  = TabBarItem_BageWH/2.0;
    UILabel * bageLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(item.imageView.frame) - bageRadius, 0, TabBarItem_BageWH, TabBarItem_BageWH)];
>>>>>>> PrivateVersion
    bageLabel.backgroundColor       = UIColorFromRGB(TabBarItem_BageBackgroundColor);
    bageLabel.textAlignment         = NSTextAlignmentCenter;
    bageLabel.font                  = [UIFont fontWithName:TabBarItem_BageFontName size:TabBarItem_BageFontSize];
    bageLabel.textColor             = UIColorFromRGB(TabBarItem_BageTextColor);
    bageLabel.layer.cornerRadius    = bageRadius;
    bageLabel.layer.masksToBounds   = YES;
    [item addSubview:bageLabel];
    item.bageLabel = bageLabel;
    item.bageLabel.text = @"99";
    return item;
}

+ (UIButton *)configPlusButton:(NSString *)image_nor {
    
    CGFloat plusW = 64;
    CGFloat plusH = 59;
    CGFloat plusY = -15;
    CGFloat plusX = (IH_DEVICE_WIDTH - plusW)/2.0;
    CGRect plusFrame = CGRectMake(plusX, plusY, plusW, plusH);
    UIButton * plusButton = [[UIButton alloc] initWithFrame:plusFrame];
    if (image_nor !=nil) {
        [plusButton setBackgroundImage:[UIImage imageNamed:image_nor] forState:UIControlStateNormal];
        
    } else {
        [plusButton setBackgroundImage:[UIImage imageNamed:TabBarItem_BageFontName_PlusButtonImageName] forState:UIControlStateNormal];
    }
    return plusButton;
}

@end
