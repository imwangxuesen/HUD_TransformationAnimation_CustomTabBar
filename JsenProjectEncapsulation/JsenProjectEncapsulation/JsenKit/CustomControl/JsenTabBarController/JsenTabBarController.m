//
//  JsenTabBarController.m
//  HearstMCB
//
//  Created by WangXuesen on 15/12/13.
//  Copyright © 2015年 hearst. All rights reserved.
//

static const CGFloat TabBar_Height = 49.0;


#import "JsenTabBarController.h"
#import "JsenTabBarItemAttribute.h"
#import "JsenCustomTabBarView.h"


@interface JsenTabBarController()<JsenCustomTabBarViewDelegate>

@property (nonatomic , strong) JsenCustomTabBarView * tabBarView;

@end

@implementation JsenTabBarController

- (void)configAttributes:(NSArray *)attributes controllers:(NSArray *)controllers showPlusItem:(BOOL)showPlusItem {
    
    self.attributes = attributes;
    self.controllers = controllers;
    self.showPlusItem = showPlusItem;
    [self createCustomTabBar];
    [self createControllers];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //将系统的标签栏隐藏
    self.tabBar.hidden = YES;
}

#pragma mark - Private Method
- (void)createControllers {
    NSMutableArray * navs = [[NSMutableArray alloc] init];
    for (UIViewController *vc in self.controllers) {
        UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:vc];
        [navs addObject:nav];
    }
    [self setViewControllers:navs animated:YES];
    
}

//创建自定义tabbar
- (void)createCustomTabBar {
    
    JsenCustomTabBarView * tabBarView = [[JsenCustomTabBarView alloc] initWithFrame:CGRectMake(0, IH_DEVICE_HEIGHT - TabBar_Height, IH_DEVICE_WIDTH, TabBar_Height)];
    tabBarView.showPlusButton = self.showPlusItem;
    tabBarView.attributes = self.attributes;
    tabBarView.delegate = self;
    [self.view addSubview:tabBarView];
    self.tabBarView = tabBarView;
    
}
//更新itme 状态
- (void)updateItemsStatus:(JsenTabBarItem *)item {
     self.selectedIndex = item.tag;
    for (UIView *subView in self.tabBarView.subviews) {
        if ([subView isKindOfClass:[JsenTabBarItem class]]) {
            JsenTabBarItem *itemTmp = (JsenTabBarItem *)subView;
            if (itemTmp.tag == item.tag) {
                itemTmp.selected = YES;
            } else {
                itemTmp.selected = NO;
            }
        }
    }
}

#pragma mark - Config Bage Num
- (void)configFirstBage:(NSString *)bageNum {
    if (self.tabBarView) {
        [self.tabBarView configFirstBage:bageNum];
    }
}
- (void)configSecondBage:(NSString *)bageNum {
    if (self.tabBarView) {
        [self.tabBarView configSecondBage:bageNum];
    }
    
}
- (void)configThirdBage:(NSString *)bageNum {
    if (self.tabBarView) {
        [self.tabBarView configThirdBage:bageNum];
    }
    
}
- (void)configFourthBage:(NSString *)bageNum {
    if (self.tabBarView) {
        [self.tabBarView configFourthBage:bageNum];
    }
    
}

#pragma mark - JsenCustomTabBarViewDelegate
- (void)plusItemClicked:(JsenTabBarItem *)item {
    
}

- (void)firstItemClicked:(JsenTabBarItem *)item {
    [self updateItemsStatus:item];
}

- (void)secondItemClicked:(JsenTabBarItem *)item {
    [self updateItemsStatus:item];
    
}

- (void)thirdItemClicked:(JsenTabBarItem *)item {
    [self updateItemsStatus:item];
    
}

- (void)fouthItemClicked:(JsenTabBarItem *)item {
    [self updateItemsStatus:item];
    
}

#pragma mark - Show Or Hiden TabBar
- (void)showWithAnimation:(BOOL)animation {
    CGFloat showY = IH_DEVICE_HEIGHT - self.tabBarView.bounds.size.height;
    if (showY == self.tabBarView.frame.origin.y) {
        return;
    }
    
    [UIView animateWithDuration:(animation?0.3:0) animations:^{
        [self.tabBarView setFrame:CGRectMake(0, showY,  self.tabBarView.bounds.size.width, self.tabBarView.bounds.size.height)];
    } completion:^(BOOL finished) {
        
    }];
    
}
- (void)hidenWithAnimation:(BOOL)animation {
    CGFloat plusY = self.tabBarView.plusItem.frame.origin.y >= 0 ? 0 : self.tabBarView.plusItem.frame.origin.y;
     CGFloat hidenY = IH_DEVICE_HEIGHT - plusY;
    if (hidenY == self.tabBarView.frame.origin.y) {
        return;
    }
    [UIView animateWithDuration:(animation?0.3:0) animations:^{
        [self.tabBarView setFrame:CGRectMake(0, hidenY,  self.tabBarView.bounds.size.width, self.tabBarView.bounds.size.height)];
    } completion:^(BOOL finished) {
        
    }];
    
}


@end
