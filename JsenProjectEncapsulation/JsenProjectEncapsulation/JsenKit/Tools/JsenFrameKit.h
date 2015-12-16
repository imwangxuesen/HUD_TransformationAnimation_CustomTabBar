//
//  JsenFrameKit.h
//  JsenProjectEncapsulation
//
//  Created by WangXuesen on 15/12/16.
//  Copyright © 2015年 Jsen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsenFrameKit : NSObject

// rect 中最大的中心正方型的frame
+ (CGRect)getMAXCenterSquareFrameFrom:(CGRect)rect;

// father rect 中最大的同 son rect比例相同的 rect
+ (CGRect)getMAXEqualScaleRectWithFatherRect:(CGRect)fatherRect sonRect:(CGRect)sonRect;
@end
