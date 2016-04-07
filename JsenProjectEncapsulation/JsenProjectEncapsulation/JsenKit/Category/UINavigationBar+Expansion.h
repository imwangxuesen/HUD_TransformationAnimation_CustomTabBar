//
//  UINavigationBar+Expansion.h
//  JsenProjectEncapsulation
//
//  Created by WangXuesen on 15/12/16.
//  Copyright © 2015年 Jsen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (Expansion)
/**
 *  设置背景色
 *
 *  @return nil
 */
- (void)jsen_setBackgroundColor:(UIColor *)backgroundColor;

/**
 *  设置透明度
 *
 *  @param alpha 透明度 0-1
 */
- (void)jsen_setElementsAlpha:(CGFloat)alpha;


/**
 *  设置y轴上的偏移量
 *
 *  @param translationY y轴偏移量
 */
- (void)jsen_setTranslationY:(CGFloat)translationY;


/**
 *  重置overlayer
 */
- (void)jsen_reset;

@end
