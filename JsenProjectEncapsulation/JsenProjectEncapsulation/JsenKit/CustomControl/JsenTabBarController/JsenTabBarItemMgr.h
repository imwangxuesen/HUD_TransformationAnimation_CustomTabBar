//
//  JsenTabBarItemMgr.h
//  HearstMCB
//
//  Created by WangXuesen on 15/12/14.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import "JsenTabBarItemAttribute.h"
#import "JsenTabBarItem.h"
@interface JsenTabBarItemMgr : NSObject

+ (JsenTabBarItem *)mgrTabBarItem:(JsenTabBarItemAttribute *)attribute frame:(CGRect)frame tag:(NSInteger)tag;

+ (UIButton *)configPlusButton:(NSString *)image_nor;
@end
