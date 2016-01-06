//
//  PingTransition.m
//  美妆嘉人
//
//  Created by WangXuesen on 15/12/29.
//  Copyright © 2015年 美妆嘉人. All rights reserved.
//

#import "PingTransition.h"
#import "JsenFoundViewController.h"
#import "JsenSettingViewController.h"
@interface PingTransition()
@property (nonatomic , strong) id <UIViewControllerContextTransitioning> transitionContext;


@end

@implementation PingTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    return 0.7f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    self.transitionContext = transitionContext;
    
    JsenFoundViewController * fromVC = (JsenFoundViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    JsenSettingViewController * toVC = (JsenSettingViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView * contView = [transitionContext containerView];
//    UIButton * button = (UIButton *)fromVC.navigationItem.rightBarButtonItem.customView;
    
    //这里因为获取不到item的bounds自定义个触发位置
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(toVC.view.bounds.size.width - 39 - 20, 20, 39, 39)];
    
    UIBezierPath *maskStartBP = [UIBezierPath bezierPathWithOvalInRect:button.frame];
    [contView addSubview:fromVC.view];
    [contView addSubview:toVC.view];
    
    CGPoint finalPoint;
    if (button.frame.origin.x > (toVC.view.bounds.size.width / 2)) {
        if (button.frame.origin.y < (toVC.view.bounds.size.height / 2)) {
            //第一象限：
            finalPoint = CGPointMake(button.center.x - 0, button.center.y - CGRectGetMaxY(toVC.view.bounds) + 30);
        } else {
            //第四象限：
            finalPoint = CGPointMake(button.center.x - 0,button.center.y - 0);
            
        }
    } else {
        if (button.frame.origin.y < (toVC.view.bounds.size.height / 2)) {
            //第二象限
            finalPoint = CGPointMake(button.center.x - CGRectGetMaxX(toVC.view.bounds) , button.center.y - CGRectGetMaxX(toVC.view.bounds));
        } else {
            //第三象限
            finalPoint = CGPointMake(button.center.x - CGRectGetMaxX(toVC.view.bounds), button.center.y - 0);
        }
    }
    
    CGFloat radius = sqrt((finalPoint.x * finalPoint.x) + (finalPoint.y * finalPoint.y));
    UIBezierPath * maskFinalBP = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(button.frame, -radius, -radius)];
    
    
    //创建一个CAShapeLayer 来扶额展示圆形覆盖
    CAShapeLayer * maskLayer = [CAShapeLayer layer];
    maskLayer.path = maskFinalBP.CGPath; //将它的path 指定为最终的path 来避免在动画完成后会弹
    toVC.view.layer.mask = maskLayer;
    
    CABasicAnimation * maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    maskLayerAnimation.fromValue = (__bridge id)(maskStartBP.CGPath);
    maskLayerAnimation.toValue = (__bridge id)(maskFinalBP.CGPath);
    maskLayerAnimation.duration = [self transitionDuration:transitionContext];
    maskLayerAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    maskLayerAnimation.delegate = self;
    [maskLayer addAnimation:maskLayerAnimation forKey:@"path"];
    
}


#pragma mark  - CABasicAnimation Delegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    //告诉iOS这个 transition 完成
    [self.transitionContext completeTransition:![self.transitionContext transitionWasCancelled]];
    
    //清除fromvc 的 mask
    [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
    [self.transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view.layer.mask = nil;
}

@end
