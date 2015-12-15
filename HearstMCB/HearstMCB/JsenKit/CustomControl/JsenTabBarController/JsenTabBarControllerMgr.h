//
//  JsenTabBarControllerMgr.h
//  HearstMCB
//
//  Created by WangXuesen on 15/12/13.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JsenTabBarController;
@interface JsenTabBarControllerMgr : NSObject
@property (nonatomic,readonly,strong)JsenTabBarController * tabBarController;

- (JsenTabBarController *)mgrTabBarControllerWithControllers:(NSArray *)controllers itemsAttribute:(NSArray *)atribute showPlusItem:(BOOL)showPlusItem;

@end
