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
#import <objc/runtime.h>


static const char plusItem;


@interface JsenCustomTabBarView()
@property (nonatomic , readwrite , assign)BOOL showPlusButton;

@end

@implementation JsenCustomTabBarView

- (instancetype)initWithFrame:(CGRect)frame showPlusButton:(BOOL)showPlusButton attributes:(NSArray *)attributes
{
    self = [super initWithFrame:frame];
    if (self) {
        self.showPlusButton = showPlusButton;
        self.attributes = attributes;
    }
    return self;
}


- (void)setAttributes:(NSArray *)attributes {
    
    _attributes = attributes;
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

- (void)addTwoItems {
    CGFloat plusItemW = self.showPlusButton ? self.plusItem.bounds.size.width : 0;
    
    CGFloat firstX = 0;
    CGFloat firstY = 7;
    CGFloat firstW = (self.bounds.size.width - plusItemW)/2.0;
    CGFloat firstH = self.bounds.size.height - firstY;
    CGRect firstItemFrame = CGRectMake(firstX, firstY, firstW, firstH);
    JsenTabBarItem * firstItem = [[JsenTabBarItem alloc] initWithFrame:firstItemFrame];
    firstItem.attribute = self.attributes[0];
    [self addSubview:firstItem];
    self.firstItem = firstItem;
    
    CGFloat secondX = self.showPlusButton ?  CGRectGetMaxX(firstItemFrame) : CGRectGetMaxX(self.plusItem.frame);
    CGFloat secondY = firstY;
    CGFloat secondW = firstW;
    CGFloat secondH = firstH;
    CGRect secondItemFrame = CGRectMake(secondX, secondY, secondW, secondH);
    JsenTabBarItem * secondItem = [[JsenTabBarItem alloc] initWithFrame:secondItemFrame];
    secondItem.attribute = self.attributes[1];
    [self addSubview:secondItem];
    self.secondItem = secondItem;
    
}

- (void)addFourItems {
    CGFloat plusItemW = self.showPlusButton ? self.plusItem.bounds.size.width : 0;
    
    CGFloat firstX = 0;
    CGFloat firstY = 7;
    CGFloat firstW = (self.bounds.size.width - plusItemW)/4.0;
    CGFloat firstH = self.bounds.size.height - firstY;
    CGRect firstItemFrame = CGRectMake(firstX, firstY, firstW, firstH);
    JsenTabBarItem * firstItem = [[JsenTabBarItem alloc] initWithFrame:firstItemFrame];
    firstItem.attribute = self.attributes[0];
    [self addSubview:firstItem];
    self.firstItem = firstItem;
    
    CGFloat secondX = CGRectGetMaxX(firstItemFrame);
    CGFloat secondY = firstY;
    CGFloat secondW = firstW;
    CGFloat secondH = firstH;
    CGRect secondItemFrame = CGRectMake(secondX, secondY, secondW, secondH);
    JsenTabBarItem * secondItem = [[JsenTabBarItem alloc] initWithFrame:secondItemFrame];
    secondItem.attribute = self.attributes[1];
    [self addSubview:secondItem];
    self.secondItem = secondItem;
    
    CGFloat thirdX = self.showPlusButton ? CGRectGetMaxX(self.plusItem.frame) : CGRectGetMaxX(secondItemFrame);
    CGFloat thirdY = secondY;
    CGFloat thirdW = secondW;
    CGFloat thirdH = secondH;
    CGRect thirdItemFrame = CGRectMake(thirdX, thirdY, thirdW, thirdH);
    JsenTabBarItem * thirdItem = [[JsenTabBarItem alloc] initWithFrame:thirdItemFrame];
    thirdItem.attribute = self.attributes[2];
    [self addSubview:thirdItem];
    self.thirdItem = thirdItem;
    
    CGFloat fouthX = CGRectGetMaxX(thirdItemFrame);
    CGFloat fouthY = thirdY;
    CGFloat fouthW = thirdW;
    CGFloat fouthH = thirdH;
    CGRect fouthItemFrame = CGRectMake(fouthX, fouthY, fouthW, fouthH);
    JsenTabBarItem * fouthItem = [[JsenTabBarItem alloc] initWithFrame:fouthItemFrame];
    secondItem.attribute = self.attributes[3];
    [self addSubview:fouthItem];
    self.fouthItem = fouthItem;
}

- (void)addPlusButton {
    UIButton *plus = [JsenTabBarItemMgr configPlusButton:nil];
    
//    objc_setAssociatedObject(self, &plusItem, plus, OBJC_ASSOCIATION_RETAIN);
    
}

//- (UIButton *)getPlusButton {
//    return objc_getAssociatedObject(self, &plusItem);
//}

//- (void)addItemWithAttribute:(JsenTabBarItemAttribute *)attribute frame:(CGRect)frame{
//    JsenTabBarItem *item = [JsenTabBarItemMgr mgrTabBarItem:attribute frame:frame];
//    objc_setAssociatedObject(self, [attribute.attributeKey UTF8String], item, OBJC_ASSOCIATION_RETAIN);
    
//}

//- (JsenTabBarItem *)getItemWithKey:(char)key {
//    return objc_getAssociatedObject(self, &key);
    
//}

@end
