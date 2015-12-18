//
//  JsenFrameKit.m
//  JsenProjectEncapsulation
//
//  Created by WangXuesen on 15/12/16.
//  Copyright © 2015年 Jsen. All rights reserved.
//

#import "JsenFrameKit.h"

@implementation JsenFrameKit

+ (CGRect)getMAXCenterSquareFrameFrom:(CGRect)rect {
    CGFloat squareWH;
    CGFloat whScale = rect.size.width / rect.size.height;
    if (whScale) {
        squareWH = rect.size.height;
    }
    
    CGPoint rectCenter = CGPointMake(rect.size.width/2.0, rect.size.height/2.0);
    CGFloat squareX = rectCenter.x - squareWH/2.0;
    CGFloat squareY = rectCenter.y - squareWH/2.0;
    CGRect squareRect = CGRectMake(squareX, squareY, squareWH, squareWH);
    return squareRect;
    
}

+ (CGRect)getMAXEqualScaleRectWithFatherRect:(CGRect)fatherRect sonRect:(CGRect)sonRect {

    CGFloat fatherW = fatherRect.size.width;
    CGFloat fatherH = fatherRect.size.height;
    
    CGFloat fatherCenterX = fatherW/2.0;
    CGFloat fatherCenterY = fatherH/2.0;
    
    CGFloat sonX = sonRect.origin.x;
    CGFloat sonY = sonRect.origin.y;
    CGFloat sonW = sonRect.size.width;
    CGFloat sonH = sonRect.size.height;
    
    CGFloat fatherWHScale = fatherW/fatherH;
    CGFloat sonWHScale = sonW/sonH;
    
    BOOL fatherWScaleMore = fatherWHScale >= sonWHScale ? YES : NO;
    BOOL fatherHLongerThanSonH = fatherH >= sonH ? YES : NO;
    BOOL fatherWLongerThanSonW = fatherW >= sonW ? YES : NO;
    if (fatherWScaleMore && !fatherHLongerThanSonH) {
        sonW = fatherH / sonH * sonW;
        sonH = fatherH;
    } else if (!fatherWScaleMore && !fatherWLongerThanSonW) {
        sonH = fatherW / sonW * sonH;
        sonW = fatherW;
        
    }
    sonX = fatherCenterX - sonW/2.0;
    sonY = fatherCenterY - sonH/2.0;
    
    return CGRectMake(sonX, sonY, sonW, sonH);
    
}
@end
