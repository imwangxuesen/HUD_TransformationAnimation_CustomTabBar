//
//  UIImage+Expansion.h
//  JsenProjectEncapsulation
//
//  Created by WangXuesen on 15/12/16.
//  Copyright © 2015年 Jsen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Expansion)
+ (UIImage *)imageWithColor:(UIColor *)color;
//裁剪
-(UIImage*)getSubImage:(CGRect)rect;
//参见中心最大的正方形
- (UIImage *)getCenterSquareImage:(CGRect)rect;
@end
