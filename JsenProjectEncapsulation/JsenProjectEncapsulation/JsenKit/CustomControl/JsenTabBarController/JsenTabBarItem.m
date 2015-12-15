//
//  JsenTabBarItem.m
//  HearstMCB
//
//  Created by WangXuesen on 15/12/13.
//  Copyright © 2015年 hearst. All rights reserved.
//



#import "JsenTabBarItem.h"
#import "JsenTabBarItemAttribute.h"
#import "JsenValidationKit.h"
#import "JsenTabBarConfig.h"
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
    [self setTitleColor:UIColorFromRGB(TabBarItem_TitleTextColor_Sel) forState:UIControlStateSelected];
    [self.titleLabel setFont:[UIFont fontWithName:@"AppleGothic" size:TabBarItem_TitleFontSize]];
    

}

- (void)configBageNum:(NSString *)bageNum {
    
    BOOL hidenBage = [JsenValidationKit isValueEmpty:bageNum] || [bageNum intValue] <= 0;
    BOOL bageBigerThanMax = [bageNum intValue] > 99;
    hidenBage ? [self showBage:NO] : [self showBage:YES];
    bageBigerThanMax ? [self.bageLabel setText:@".."]:[self.bageLabel setText:bageNum];
    
}

- (void)showBage:(BOOL)showBage {
    self.bageLabel.hidden = !showBage;
    
}

@end


