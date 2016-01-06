//
//  JsenJumpView.m
//  JsenProjectEncapsulation
//
//  Created by WangXuesen on 16/1/4.
//  Copyright © 2016年 Jsen. All rights reserved.
//

#import "JsenJumpView.h"


#define jumpDuration 0.125
#define downDuration 0.215


@interface JsenJumpView()

@property (nonatomic , strong) UIImageView * startView;
@property (nonatomic , strong) UIImageView * shadowView;
@property (nonatomic , assign) BOOL animating;

@end

@implementation JsenJumpView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame markImage:(NSString *)markImage nonMarkImage:(NSString *)nonMarkImage
{
    self = [super initWithFrame:frame];
    if (self) {
        self.markedImage = [UIImage imageNamed:@"praised"];
        self.non_markedImage = [UIImage imageNamed:@"praise"];
    }
    return self;
}

- (instancetype)initWithMarkImage:(NSString *)markImage nonMarkImage:(NSString *)nonMarkImage {
    self = [super init];
    if (self) {
        self.markedImage = [UIImage imageNamed:@"praised"];
        self.non_markedImage = [UIImage imageNamed:@"praise"];
    }
    return self;
}
- (void)layoutSubviews {
    
    [super layoutSubviews];
    self.backgroundColor = [UIColor clearColor];
    if (self.startView == nil) {
        self.startView = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width / 2.0 - (self.bounds.size.width - 6) / 2.0, 0, self.bounds.size.width - 6, self.bounds.size.height - 6)];
        self.startView.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:self.startView];
    }
    
    if (self.shadowView == nil) {
        self.shadowView = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width / 2.0 - 10/2.0, self.bounds.size.height - 3, 10, 3)];
        self.shadowView.alpha = 0.4;
        self.shadowView.image = [UIImage imageNamed:@"shadow"];
        [self addSubview:self.shadowView];
        
    }

}


- (void)setState:(JsenJumpViewState)state {
    
    _state = state;
    
    self.startView.image = _state == JsenJumpViewStateJump? _markedImage : _non_markedImage;
}

// 上弹动画
- (void)animate {
    
    if (_animating == YES) {
        return;
    }
    
    _animating = NO;
    CABasicAnimation * transformAnima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    transformAnima.fromValue = @(0);
    transformAnima.toValue = @(M_PI_2);
    transformAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    CABasicAnimation * positionAnima = [CABasicAnimation animationWithKeyPath:@"position.y"];
    positionAnima.fromValue = @(self.startView.center.y);
    positionAnima.toValue = @(self.startView.center.y - 14);
    positionAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CAAnimationGroup * animaGroup = [CAAnimationGroup animation];
    animaGroup.duration = jumpDuration;
    animaGroup.fillMode = kCAFillModeForwards;
    animaGroup.removedOnCompletion = NO;
    animaGroup.delegate = self;
    animaGroup.animations = @[transformAnima,positionAnima];
    
    [self.startView.layer addAnimation:animaGroup forKey:@"jumpUp"];
    
    
}

//阴影的动画
- (void)animationDidStart:(CAAnimation *)anim {
    if ([anim isEqual:[self.startView.layer animationForKey:@"jumpUp"]]) {
        [UIView animateWithDuration:jumpDuration delay:0.0f options:UIViewAnimationOptionCurveEaseOut animations:^{
            _shadowView.alpha = 0.2;
            _shadowView.bounds = CGRectMake(0, 0, _shadowView.bounds.size.width * 1.6, _shadowView.bounds.size.height);
        } completion:NULL];
        
    } else if ([anim isEqual:[self.startView.layer animationForKey:@"jumpDown"]]) {
        [UIView animateWithDuration:jumpDuration delay:0.0f options:UIViewAnimationOptionCurveEaseOut animations:^{
            _shadowView.alpha = 0.4;
            _shadowView.bounds = CGRectMake(0, 0, _shadowView.bounds.size.width / 1.6, _shadowView.bounds.size.height);
        } completion:NULL];
        
    }
    
}

//下落动画
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    if ([anim isEqual:[self.startView.layer animationForKey:@"jumpUp"]]) {
        self.state = self.state == JsenJumpViewStateJump? JsenJumpViewStateDown : JsenJumpViewStateJump;
        
        CABasicAnimation * transforAnima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
        transforAnima.fromValue = @(M_PI_2);
        transforAnima.toValue = @(M_PI);
        transforAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        
        CABasicAnimation * positionAnima = [CABasicAnimation animationWithKeyPath:@"position.y"];
        positionAnima.fromValue = @(self.startView.center.y);
        positionAnima.toValue = @(self.startView.center.y + 7);
        positionAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        
        CAAnimationGroup * animationGroup = [CAAnimationGroup animation];
        animationGroup.duration = downDuration;
        animationGroup.fillMode = kCAFillModeForwards;
        animationGroup.removedOnCompletion = NO;
        animationGroup.delegate = self;
        animationGroup.animations = @[transforAnima,positionAnima];
        [self.startView.layer addAnimation:animationGroup forKey:@"jumpDown"];
    
    } else if([anim isEqual:[self.startView.layer animationForKey:@"jumpDown"]]) {
        
        [self.startView.layer removeAllAnimations];
        _animating = NO;
    }
}

@end
