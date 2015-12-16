//
//  UIImage+Expansion.m
//  JsenProjectEncapsulation
//
//  Created by WangXuesen on 15/12/16.
//  Copyright © 2015年 Jsen. All rights reserved.
//

#import "UIImage+Expansion.h"

@implementation UIImage (Expansion)
+ (UIImage *)imageWithColor:(UIColor *)color
{
    NSParameterAssert(color != nil);
    
    CGRect rect = CGRectMake(0, 0, 1, 1);
    // Create a 1 by 1 pixel context
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);   // Fill it with your color
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

//截取部分图像
-(UIImage*)getSubImage:(CGRect)rect
{
    CGImageRef subImageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContext(smallBounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    
    return smallImage;
}

- (UIImage *)getCenterSquareImage:(CGRect)rect {
    
    CGFloat squareWH = rect.size.width >= rect.size.height ? rect.size.height : rect.size.width;
    CGPoint squareCenter = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0);
    CGFloat squareX = squareCenter.x - squareWH/2.0;
    CGFloat squareY = squareCenter.y - squareWH/2.0;
    CGRect squareRect = CGRectMake(squareX, squareY, squareWH, squareWH);
    return [self getSubImage:squareRect];
    
};


@end
