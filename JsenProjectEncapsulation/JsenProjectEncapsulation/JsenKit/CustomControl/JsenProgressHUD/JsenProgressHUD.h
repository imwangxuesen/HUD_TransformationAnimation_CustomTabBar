//
//  JsenProgressHUD.h
//  JsenProjectEncapsulation
//
//  Created by WangXuesen on 15/12/17.
//  Copyright © 2015年 Jsen. All rights reserved.
//

#import <UIKit/UIKit.h>

#define Jsen_HUD_FONT         [UIFont boldSystemFontOfSize:14]
#define Jsen_HUD_COLOR		  UIColorFromRGB(0x353535)

#define Jsen_HUD_SPINNER_COLOR		UIColorFromRGB(0xb9dc2f)
#define Jsen_HUD_BACKGROUND_COLOR	UIColorFromRGB(0xffffff)
#define Jsen_HUD_WINDOW_COLOR		[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.2]

#define Jsen_HUD_IMAGE_SUCCESS		[UIImage imageNamed:@"success"]
#define Jsen_HUD_IMAGE_ERROR		[UIImage imageNamed:@"error"]


@interface JsenProgressHUD : UIView

@property (nonatomic , assign) BOOL interaction;

@property (nonatomic, retain) UIWindow                *window;
@property (nonatomic, retain) UIView                  *background;
@property (nonatomic, retain) UIToolbar               *hud;
@property (nonatomic, retain) UIActivityIndicatorView *spinner;
@property (nonatomic, retain) UIImageView             *image;
@property (nonatomic, retain) UILabel                 *label;

+ (JsenProgressHUD *)shareDefault;

+ (void)dismiss;

+ (void)showText:(NSString *)text interaction:(BOOL)interaction;
+ (void)showText:(NSString *)text;

+ (void)showSuccess:(NSString *)text;
+ (void)showSuccess:(NSString *)text interaction:(BOOL)interaction;

+ (void)showError:(NSString *)text;
+ (void)showError:(NSString *)text interaction:(BOOL)interaction;



@end
