//
//  NSString+Expansion.m
//  JsenProjectEncapsulation
//
//  Created by WangXuesen on 15/12/16.
//  Copyright © 2015年 Jsen. All rights reserved.
//

#import "NSString+Expansion.h"

@implementation NSString (Expansion)
- (CGSize)boundsWithMaxWidth:(CGFloat)maxWidth font:(UIFont *)font {

    CGSize boundSize = CGSizeMake(maxWidth, MAXFLOAT);
    NSDictionary *attributes = @{
                                 NSFontAttributeName:font,
                                 };
    CGSize countSize = [self boundingRectWithSize:boundSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    return countSize;
    
}
@end
