//
//  JsenTabBarItemAttribute.m
//  HearstMCB
//
//  Created by WangXuesen on 15/12/13.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import "JsenTabBarItemAttribute.h"

@implementation JsenTabBarItemAttribute

- (instancetype)initWithTitle:(NSString *)title imageNameForSel:(NSString *)imageNameForSel imageNameForNor:(NSString *)imageNameForNor
{
    self = [super init];
    if (self) {
        self.title           = title;
        self.imageNameForNor = imageNameForNor;
        self.imageNameForSel = imageNameForSel;
    }
    return self;
}

@end
