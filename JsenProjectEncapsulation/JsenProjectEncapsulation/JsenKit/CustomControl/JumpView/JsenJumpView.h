//
//  JsenJumpView.h
//  JsenProjectEncapsulation
//
//  Created by WangXuesen on 16/1/4.
//  Copyright © 2016年 Jsen. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, JsenJumpViewState) {
    /**
     * 上跳状态.
     */
    JsenJumpViewStateJump,
    /**
     * 下落状态.
     */
    JsenJumpViewStateDown,
};


@interface JsenJumpView : UIView

@property (nonatomic , assign) JsenJumpViewState state;
@property (nonatomic , strong) UIImage * markedImage;
@property (nonatomic , strong) UIImage * non_markedImage;
- (instancetype)initWithFrame:(CGRect)frame markImage:(NSString *)markImage nonMarkImage:(NSString *)nonMarkImage;

- (instancetype)initWithMarkImage:(NSString *)markImage nonMarkImage:(NSString *)nonMarkImage;

- (void)animate;
@end
