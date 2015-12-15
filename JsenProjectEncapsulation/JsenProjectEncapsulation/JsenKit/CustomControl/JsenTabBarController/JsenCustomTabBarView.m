//
//  JsenCustomTabBarView.m
//  HearstMCB
//
//  Created by WangXuesen on 15/12/14.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import "JsenCustomTabBarView.h"
#import "JsenTabBarItemAttribute.h"
#import "JsenTabBarItemMgr.h"

static const int TabBar_BackgroundColor = 0xffffff;

@interface JsenCustomTabBarView()

@end

@implementation JsenCustomTabBarView

#pragma mark - Set Get
- (void)setAttributes:(NSArray *)attributes {
    
    _attributes = attributes;
    [self setBackgroundColor:UIColorFromRGB(TabBar_BackgroundColor)];
    if (self.showPlusButton) {
        [self addPlusButton];
    }
    switch (attributes.count) {
        case 2:
            [self addTwoItems];
            break;
        case 4:
            [self addFourItems];
            break;
            
        default:
            break;
    }
    
}

#pragma mark - Private Method
- (void)addTwoItems {
    CGFloat plusItemW = self.showPlusButton ? self.plusItem.bounds.size.width : 0;
    
    CGFloat firstX = 0;
    CGFloat firstY = 7;
    CGFloat firstW = (self.bounds.size.width - plusItemW)/2.0;
    CGFloat firstH = self.bounds.size.height - firstY;
    CGRect firstItemFrame = CGRectMake(firstX, firstY, firstW, firstH);
    JsenTabBarItem * firstItem = [[JsenTabBarItem alloc] initWithFrame:firstItemFrame];
    firstItem.tag = 0;
    firstItem.attribute = self.attributes[0];
    [firstItem addTarget:self action:@selector(firstItemClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:firstItem];
    self.firstItem = firstItem;
    
    CGFloat secondX = self.showPlusButton ?  CGRectGetMaxX(firstItemFrame) : CGRectGetMaxX(self.plusItem.frame);
    CGFloat secondY = firstY;
    CGFloat secondW = firstW;
    CGFloat secondH = firstH;
    CGRect secondItemFrame = CGRectMake(secondX, secondY, secondW, secondH);
    JsenTabBarItem * secondItem = [[JsenTabBarItem alloc] initWithFrame:secondItemFrame];
    secondItem.tag = 1;
    secondItem.attribute = self.attributes[1];
    [secondItem addTarget:self action:@selector(secondItemClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:secondItem];
    self.secondItem = secondItem;
    
}

- (void)addFourItems {
    CGFloat plusItemW = self.showPlusButton ? self.plusItem.bounds.size.width : 0;
    
    CGFloat firstX = 0;
    CGFloat firstY = 0;
    CGFloat firstW = (self.bounds.size.width - plusItemW)/4.0;
    CGFloat firstH = self.bounds.size.height - firstY;
    CGRect firstItemFrame = CGRectMake(firstX, firstY, firstW, firstH);
    JsenTabBarItem * firstItem = [JsenTabBarItemMgr mgrTabBarItem:self.attributes[0] frame:firstItemFrame tag:0];
    [firstItem addTarget:self action:@selector(firstItemClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:firstItem];
    self.firstItem = firstItem;
    
    CGFloat secondX = CGRectGetMaxX(firstItemFrame);
    CGFloat secondY = firstY;
    CGFloat secondW = firstW;
    CGFloat secondH = firstH;
    CGRect secondItemFrame = CGRectMake(secondX, secondY, secondW, secondH);
    JsenTabBarItem * secondItem = [JsenTabBarItemMgr mgrTabBarItem:self.attributes[1] frame:secondItemFrame tag:1];
    [secondItem addTarget:self action:@selector(secondItemClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:secondItem];
    self.secondItem = secondItem;
    
    CGFloat thirdX = self.showPlusButton ? CGRectGetMaxX(self.plusItem.frame) : CGRectGetMaxX(secondItemFrame);
    CGFloat thirdY = secondY;
    CGFloat thirdW = secondW;
    CGFloat thirdH = secondH;
    CGRect thirdItemFrame = CGRectMake(thirdX, thirdY, thirdW, thirdH);
    JsenTabBarItem * thirdItem = [JsenTabBarItemMgr mgrTabBarItem:self.attributes[2] frame:thirdItemFrame tag:2];
    [thirdItem addTarget:self action:@selector(thirdItemClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:thirdItem];
    self.thirdItem = thirdItem;
    
    CGFloat fouthX = CGRectGetMaxX(thirdItemFrame);
    CGFloat fouthY = thirdY;
    CGFloat fouthW = thirdW;
    CGFloat fouthH = thirdH;
    CGRect fouthItemFrame = CGRectMake(fouthX, fouthY, fouthW, fouthH);
    JsenTabBarItem *fouthItem = [JsenTabBarItemMgr mgrTabBarItem:self.attributes[3] frame:fouthItemFrame tag:3];
    [fouthItem addTarget:self action:@selector(fouthItemClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:fouthItem];
    self.fouthItem = fouthItem;
}

- (void)addPlusButton {
    UIButton *plus = [JsenTabBarItemMgr configPlusButton:nil];
    [plus addTarget:self action:@selector(plusItemClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:plus];
    self.plusItem = plus;

}

- (void)configFirstBage:(NSString *)bageNum {
    if (self.firstItem) {
        [self.firstItem configBageNum:bageNum];
    }
}

- (void)configSecondBage:(NSString *)bageNum {
    if (self.secondItem) {
        [self.secondItem configBageNum:bageNum];
    }
}

- (void)configThirdBage:(NSString *)bageNum {
    if (self.thirdItem) {
        [self.thirdItem configBageNum:bageNum];
    }
}

- (void)configFourthBage:(NSString *)bageNum {
    if (self.fouthItem) {
        [self.fouthItem configBageNum:bageNum];
    }
}


#pragma mark - Actions

- (void)plusItemClicked:(UIButton *)item {
    [self.delegate plusItemClicked:item];
}

- (void)firstItemClicked:(JsenTabBarItem *)item {
    [self.delegate firstItemClicked:item];
    
}

- (void)secondItemClicked:(JsenTabBarItem *)item {
    [self.delegate secondItemClicked:item];
    
}

- (void)thirdItemClicked:(JsenTabBarItem *)item {
    [self.delegate thirdItemClicked:item];
    
}

- (void)fouthItemClicked:(JsenTabBarItem *)item {
    [self.delegate fouthItemClicked:item];
    
}

@end
