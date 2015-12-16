//
//  JsenTitleView.m
//  JsenProjectEncapsulation
//
//  Created by WangXuesen on 15/12/16.
//  Copyright © 2015年 Jsen. All rights reserved.
//

#import "JsenTitleView.h"

@implementation JsenTitleView

+ (JsenTitleView *)titleView:(NSString *)imageName title:(NSString *)title {
    BOOL showImage = imageName ? YES : NO;
    BOOL showTitle = title ? YES : NO;
    BOOL nothing = showImage && showTitle ? NO : YES;
    return nil;
}

@end
