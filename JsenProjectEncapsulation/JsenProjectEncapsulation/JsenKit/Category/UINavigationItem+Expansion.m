//
//  UINavigationItem+Expansion.m
//  JsenProjectEncapsulation
//
//  Created by WangXuesen on 15/12/16.
//  Copyright © 2015年 Jsen. All rights reserved.
//

#import "UINavigationItem+Expansion.h"
#import "JsenTitleView.h"
@implementation UINavigationItem (Expansion)

- (void)jsen_setTitleView:(JsenTitleView *)titleView {
    self.titleView = titleView;
}

@end
