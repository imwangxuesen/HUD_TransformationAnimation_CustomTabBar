//
//  JsenProgressHUD.m
//  JsenProjectEncapsulation
//
//  Created by WangXuesen on 15/12/17.
//  Copyright © 2015年 Jsen. All rights reserved.
//

#import "JsenProgressHUD.h"

@implementation JsenProgressHUD

+ (JsenProgressHUD *)shareDefault {
    static dispatch_once_t once = 0;
    static JsenProgressHUD * progressHUD;
    
    dispatch_once(&once, ^{progressHUD = [[JsenProgressHUD alloc] init];});
    
    return progressHUD;
    
}

- (instancetype)init
{
    self = [super initWithFrame:[[UIScreen mainScreen] bounds]];
    
    id<UIApplicationDelegate> delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate respondsToSelector:@selector(window)]) {
        self.window = [delegate performSelector:@selector(window)];
    } else {
        self.window = [[UIApplication sharedApplication] keyWindow];
    }
    
    self.background = nil;
    self.hud        = nil;
    self.spinner    = nil;
    self.image      = nil;
    self.label      = nil;
    self.alpha      = 0;
    
    return self;
}


#pragma mark -
#pragma mark - Private Method
//配置hud 并展示
- (void)configHUD:(NSString *)text image:(UIImage *)image showSpinner:(BOOL)showSpinner autoHidenHUD:(BOOL)autoHiden {
    
    [self createHUD];
    
    self.label.text     = text;
    self.label.hidden   = (text == nil ? YES : NO);
    
    self.image.image    = image;
    NSLog(@"%d",(image == nil ? YES : NO));
    self.image.hidden   = (image == nil ? YES : NO);
    
    if (showSpinner) {
        [self.spinner startAnimating];
    } else {
        [self.spinner stopAnimating];
    }
    
    [self configHUDSize];
    [self hudPosition:nil];
    [self showHUD];
    
    if (autoHiden) {
        [NSThread detachNewThreadSelector:@selector(getToHide) toTarget:self withObject:nil];
    }
    
}

//配置hud的大小
- (void)configHUDSize
{
    CGRect labelRect = CGRectZero;
    CGFloat hudWidth = 100, hudHeight = 100;
    
    if (self.label.text != nil)
    {
        NSDictionary *attributes = @{NSFontAttributeName:self.label.font};
        NSInteger options = NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin;
        labelRect = [self.label.text boundingRectWithSize:CGSizeMake(200, 300) options:options attributes:attributes context:NULL];
        
        labelRect.origin.x = 12;
        labelRect.origin.y = 66;
        
        hudWidth = labelRect.size.width + 24;
        hudHeight = labelRect.size.height + 80;
        
        if (hudWidth < 100)
        {
            hudWidth = 100;
            labelRect.origin.x = 0;
            labelRect.size.width = 100;
        }
    }
    
    self.hud.bounds = CGRectMake(0, 0, hudWidth, hudHeight);
    
    CGFloat imagex = hudWidth/2;
    CGFloat imagey = (self.label.text == nil) ? hudHeight/2 : 36;
    self.image.center = self.spinner.center = CGPointMake(imagex, imagey);
    
    self.label.frame = labelRect;
}

//创建hud
- (void)createHUD {
    if (!self.hud) {
        self.hud = [[UIToolbar alloc] initWithFrame:CGRectZero];
        self.hud.translucent          = YES;
        self.hud.backgroundColor      = Jsen_HUD_BACKGROUND_COLOR;
        self.hud.layer.cornerRadius   = 10;
        self.hud.layer.masksToBounds  = YES;
    }
    
    if (!self.hud.superview) {
        if (!self.interaction) {
            self.background = [[UIView alloc] initWithFrame:self.window.frame];
            self.background.backgroundColor = Jsen_HUD_WINDOW_COLOR;
            [self.window addSubview:self.background];
            [self.background addSubview:self.hud];
        } else {
            [self.window addSubview:self.hud];
        }
    }
    
    if (!self.spinner) {
        self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        self.spinner.color = Jsen_HUD_SPINNER_COLOR;
        self.spinner.hidesWhenStopped = YES;
    }
    
    if (!self.spinner.superview) {
        [self.hud addSubview:self.spinner];
    }
    
    if (!self.image) {
        self.image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 28, 28)];
        
    }
    
    if (!self.image.superview) {
        [self.hud addSubview:self.image];
    }
    
    if (!self.label) {
        self.label = [[UILabel alloc] initWithFrame:CGRectZero];
        self.label.font                 = Jsen_HUD_FONT;
        self.label.textColor            = Jsen_HUD_COLOR;
        self.label.backgroundColor      = [UIColor clearColor];
        self.label.textAlignment        = NSTextAlignmentCenter;
        self.label.baselineAdjustment   = UIBaselineAdjustmentAlignCenters;
        self.label.numberOfLines        = 0;
    }
    
    if (!self.label.superview) {
        [self.hud addSubview:self.label];
    }
    
    
}

//注册监听键盘动作
- (void)registerNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hudPosition:)
                                                 name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hudPosition:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hudPosition:) name:UIKeyboardDidHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hudPosition:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hudPosition:) name:UIKeyboardDidShowNotification object:nil];
}

//监听键盘状态，做出对hud的位置调整
- (void)hudPosition:(NSNotification *)notification
{
    CGFloat heightKeyboard = 0;
    NSTimeInterval duration = 0;
    
    if (notification != nil)
    {
        NSDictionary *info = [notification userInfo];
        CGRect keyboard = [[info valueForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
        duration = [[info valueForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
        if ((notification.name == UIKeyboardWillShowNotification) || (notification.name == UIKeyboardDidShowNotification))
        {
            heightKeyboard = keyboard.size.height;
        }
    }
    else heightKeyboard = [self keyboardHeight];
    
    CGRect screen = [UIScreen mainScreen].bounds;
    CGPoint center = CGPointMake(screen.size.width/2, (screen.size.height-heightKeyboard)/2);
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        self.hud.center = CGPointMake(center.x, center.y);
    } completion:nil];
    
    if (self.background != nil) self.background.frame = self.window.frame;
}

//获取键盘高
- (CGFloat)keyboardHeight
{
    for (UIWindow *testWindow in [[UIApplication sharedApplication] windows])
    {
        if ([[testWindow class] isEqual:[UIWindow class]] == NO)
        {
            for (UIView *possibleKeyboard in [testWindow subviews])
            {
                if ([[possibleKeyboard description] hasPrefix:@"<UIPeripheralHostView"])
                {
                    return possibleKeyboard.bounds.size.height;
                }
                else if ([[possibleKeyboard description] hasPrefix:@"<UIInputSetContainerView"])
                {
                    for (UIView *hostKeyboard in [possibleKeyboard subviews])
                    {
                        if ([[hostKeyboard description] hasPrefix:@"<UIInputSetHost"])
                        {
                            return hostKeyboard.frame.size.height;
                        }
                    }
                }
            }
        }
    }
    return 0;
}


// 自动隐藏时的调用方法
- (void)getToHide {
    
    NSUInteger length = self.label.text.length;
    NSTimeInterval sleepTime = length * 0.04 + 0.5;
    [NSThread sleepForTimeInterval:sleepTime];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self hideHUD];
    });
}

//销毁hud
- (void)hudDestroy
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [self.label removeFromSuperview];
    self.label = nil;
    
    [self.image removeFromSuperview];
    self.image = nil;
    
    [self.spinner removeFromSuperview];
    self.spinner = nil;
    
    [self.hud removeFromSuperview];
    self.hud = nil;
    
    [self.background removeFromSuperview];
    self.background = nil;
}

#pragma mark -
#pragma mark - Public Method
+ (void)dismiss {
    
    [[self shareDefault] hideHUD];
}

- (void)showHUD {
    
    if (self.alpha == 0)
    {
        self.alpha = 1;
        
        self.hud.alpha = 0;
        self.hud.transform = CGAffineTransformScale(self.hud.transform, 1.4, 1.4);
        
        NSUInteger options = UIViewAnimationOptionAllowUserInteraction | UIViewAnimationCurveEaseOut;
        [UIView animateWithDuration:0.15 delay:0 options:options animations:^{
            self.hud.transform = CGAffineTransformScale(self.hud.transform, 1/1.4, 1/1.4);
            self.hud.alpha = 1;
        } completion:nil];
    }
}

- (void)hideHUD {
    if (self.alpha != 0)
    {
        NSUInteger options = UIViewAnimationOptionAllowUserInteraction | UIViewAnimationCurveEaseIn;
        [UIView animateWithDuration:0.15 delay:0 options:options animations:^{
            self.hud.transform = CGAffineTransformScale(self.hud.transform, 0.7, 0.7);
            self.hud.alpha = 0;
        }
                         completion:^(BOOL finished) {
                             [self hudDestroy];
                             self.alpha = 0;
                         }];
    }
    
}

+ (void)showText:(NSString *)text interaction:(BOOL)interaction {
    [self shareDefault].interaction = interaction;
    [[self shareDefault] configHUD:text image:nil showSpinner:YES autoHidenHUD:NO];
  
}

+ (void)showText:(NSString *)text {
    [self shareDefault].interaction = YES;
    [[self shareDefault] configHUD:text image:nil showSpinner:YES autoHidenHUD:NO];
}

+ (void)showSuccess:(NSString *)text {
    [self shareDefault].interaction = YES;
    [[self shareDefault] configHUD:text image:Jsen_HUD_IMAGE_SUCCESS showSpinner:NO autoHidenHUD:YES];
    
}

+ (void)showSuccess:(NSString *)text interaction:(BOOL)interaction {
    [self shareDefault].interaction = interaction;
    [[self shareDefault] configHUD:text image:Jsen_HUD_IMAGE_SUCCESS showSpinner:NO autoHidenHUD:YES];
    
}

+ (void)showError:(NSString *)text {
    [self shareDefault].interaction = YES;
    [[self shareDefault] configHUD:text image:Jsen_HUD_IMAGE_ERROR showSpinner:NO autoHidenHUD:YES];
}

+ (void)showError:(NSString *)text interaction:(BOOL)interaction {
    [self shareDefault].interaction = interaction;
    [[self shareDefault] configHUD:text image:Jsen_HUD_IMAGE_ERROR showSpinner:NO autoHidenHUD:YES];
}

@end
