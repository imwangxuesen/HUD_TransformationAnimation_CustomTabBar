//
//  JsenCustomTabBarView.h
//  HearstMCB
//
//  Created by WangXuesen on 15/12/14.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import "JsenBaseView.h"
#import "JsenTabBarItem.h"
@interface JsenCustomTabBarView : JsenBaseView

@property (nonatomic , strong) JsenTabBarItem * firstItem;
@property (nonatomic , strong) JsenTabBarItem * secondItem;
@property (nonatomic , strong) JsenTabBarItem * thirdItem;
@property (nonatomic , strong) JsenTabBarItem * fouthItem;
@property (nonatomic , strong) UIButton * plusItem;

@property (nonatomic , strong) NSArray * attributes;
@property (nonatomic , readonly , assign) BOOL showPlusButton;

- (instancetype)initWithFrame:(CGRect)frame showPlusButton:(BOOL)showPlusButton attributes:(NSArray *)attributes;
@end
