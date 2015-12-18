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
    JsenTabBarItem * item = [[JsenTabBarItem alloc] initWithFrame:frame];
    item.attribute = attribute;
    item.tag       = tag;
    
    CGFloat btnW = item.frame.size.width;
    CGFloat btnH = item.frame.size.height;
    
    CGRect imageFrame = item.imageView.frame;
    CGRect titleFrame = item.titleLabel.frame;
    
    CGFloat imageX = imageFrame.origin.x;
    CGFloat imageY = imageFrame.origin.y;
    CGFloat imageW = imageFrame.size.width;
    CGFloat imageH = imageFrame.size.height;
    
    CGFloat labelX = titleFrame.origin.x;
    CGFloat labelY = titleFrame.origin.y;
    CGFloat labelW = titleFrame.size.width;
    CGFloat labelH = titleFrame.size.height;
    
    // 计算按钮图片与文字的总高度(包含间距)
    CGFloat space = 3.f;
    CGFloat controlsHeight = imageH+labelH;
    // 边界总距离
    CGFloat top = (btnH - controlsHeight - space);
    
    [item.imageView setContentMode:UIViewContentModeCenter];
    [item.titleLabel setContentMode:UIViewContentModeCenter];
    
    //设置图片的偏移
    CGFloat imageEdgeInsetsTop    = imageY > top*2/3 ? top*2/3-imageY : imageY;
    CGFloat imageEdgeInsetsLeft   = (btnW - imageW)/2 - imageX;
    CGFloat imageEdgeInsetsBottom = -imageEdgeInsetsTop;
    CGFloat imageEdgeInsetsRight  = -(btnW - imageW)/2 + imageX;
    [item setImageEdgeInsets:UIEdgeInsetsMake(imageEdgeInsetsTop, imageEdgeInsetsLeft, imageEdgeInsetsBottom, imageEdgeInsetsRight)];
    
    //设置标题的偏移
    CGFloat labelEdgeInsetsTop    = (imageY+imageH+imageEdgeInsetsTop+space)-labelY;
    CGFloat labelEdgeInsetsRight  = labelX-(btnW - labelW)/2;
    CGFloat labelEdgeInsetsLeft   = -labelEdgeInsetsRight;
    CGFloat labelEdgeInsetsBottom = -labelEdgeInsetsTop;
    
    [item setTitleEdgeInsets:UIEdgeInsetsMake(labelEdgeInsetsTop, labelEdgeInsetsLeft, labelEdgeInsetsBottom, labelEdgeInsetsRight)];
    
    //设置bagelabel 的属性
    CGFloat bageRadius  = TabBarItem_BageWH/2.0;
    UILabel * bageLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(item.imageView.frame) - bageRadius, 0, TabBarItem_BageWH, TabBarItem_BageWH)];
    bageLabel.backgroundColor       = UIColorFromRGB(TabBarItem_BageBackgroundColor);
    bageLabel.textAlignment         = NSTextAlignmentCenter;
    bageLabel.font                  = [UIFont fontWithName:TabBarItem_BageFontName size:TabBarItem_BageFontSize];
    bageLabel.textColor             = UIColorFromRGB(TabBarItem_BageTextColor);
    bageLabel.layer.cornerRadius    = bageRadius;
    bageLabel.layer.masksToBounds   = YES;
    bageLabel.hidden                = YES;
    [item addSubview:bageLabel];
    item.bageLabel = bageLabel;
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
