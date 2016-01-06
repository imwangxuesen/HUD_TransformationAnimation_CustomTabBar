//
//  PingInvertTransition.m
//  美妆嘉人
//
//  Created by WangXuesen on 15/12/29.
//  Copyright © 2015年 美妆嘉人. All rights reserved.
//

#import "PingInvertTransition.h"
#import "JsenFoundViewController.h"
#import "JsenSettingViewController.h"

@interface PingInvertTransition()

@property (nonatomic , strong) id<UIViewControllerContextTransitioning>transitionContext;

@end

@implementation PingInvertTransition



- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    
    return 0.7f;
    
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    self.transitionContext = transitionContext;
    
    JsenFoundViewController *toVC = (JsenFoundViewController *)[self.transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    JsenSettingViewController * fromVC = (JsenSettingViewController *)[self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView * contView = [transitionContext containerView];
//    UIButton * button = (UIButton *)toVC.navigationItem.leftBarButtonItem.customView;
    
    //这里因为获取不到item的bounds自定义个触发位置
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 39, 39)];
    
    [contView addSubview:toVC.view];
    [contView addSubview:fromVC.view];
    
    UIBezierPath *finalPath = [UIBezierPath bezierPathWithOvalInRect:button.frame];
    
    CGPoint finalPoint;
    
    
    if (button.frame.origin.x > (toVC.view.bounds.size.width / 2)) {
        if (button.frame.origin.y < (toVC.view.bounds.size.height / 2)) {
            //第一象限
            finalPoint = CGPointMake(button.frame.origin.x - 0 , CGRectGetMaxY(toVC.view.bounds) - button.center.y + 30);
        } else {
            //第四象限
            finalPoint = CGPointMake(button.frame.origin.x - 0, button.center.y - 0);
        }
    } else {
        
        if (button.frame.origin.y < (toVC.view.bounds.size.height / 2)) {
            //第二象限
            finalPoint = CGPointMake(CGRectGetMaxX(toVC.view.bounds) - button.center.x, CGRectGetMaxY(toVC.view.bounds) - button.center.y + 30);
        } else {
            //第三象限
            finalPoint = CGPointMake(CGRectGetMaxX(toVC.view.bounds) - button.center.x, CGRectGetMaxY(toVC.view.bounds)- button.center.y + 30);
        }
    }
    
    CGFloat radius = sqrt(finalPoint.x * finalPoint.x + finalPoint.y * finalPoint.y);
    UIBezierPath *startPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(button.frame, -radius,-radius)];
    
    CAShapeLayer * maskLayer = [CAShapeLayer layer];
    maskLayer.path = finalPath.CGPath;
    fromVC.view.layer.mask = maskLayer;
    
    CABasicAnimation *pingAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    pingAnimation.fromValue = (__bridge id)(startPath.CGPath);
    pingAnimation.toValue = (__bridge id)(finalPath.CGPath);
    pingAnimation.duration = [self transitionDuration:transitionContext];
    pingAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    pingAnimation.delegate = self;
    
    [maskLayer addAnimation:pingAnimation forKey:@"pingInvert"];
    
    
}


- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    [self.transitionContext completeTransition:![self.transitionContext transitionWasCancelled]];
    [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
    [self.transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view.layer.mask = nil;
    
}


@end
