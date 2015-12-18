//
//  JsenCustomTabBarView.h
//  HearstMCB
//
//  Created by WangXuesen on 15/12/14.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import "JsenBaseView.h"
#import "JsenTabBarItem.h"

@protocol JsenCustomTabBarViewDelegate <NSObject>

- (void)plusItemClicked:(UIButton *)item;
- (void)firstItemClicked:(JsenTabBarItem *)item;
- (void)secondItemClicked:(JsenTabBarItem *)item;
- (void)thirdItemClicked:(JsenTabBarItem *)item;
- (void)fouthItemClicked:(JsenTabBarItem *)item;

@end

@interface JsenCustomTabBarView : JsenBaseView
//-------------------------------------------------------------------------------------------------------------------------------------------------
@property (nonatomic , strong) JsenTabBarItem * firstItem;
@property (nonatomic , strong) JsenTabBarItem * secondItem;
@property (nonatomic , strong) JsenTabBarItem * thirdItem;
@property (nonatomic , strong) JsenTabBarItem * fouthItem;
@property (nonatomic , strong) UIButton       * plusItem;
//-------------------------------------------------------------------------------------------------------------------------------------------------
@property (nonatomic , strong) NSArray        * attributes;
@property (nonatomic , assign) BOOL           showPlusButton;
//-------------------------------------------------------------------------------------------------------------------------------------------------
@property (nonatomic , weak) id<JsenCustomTabBarViewDelegate>delegate;

//------------------------------------------------------------------------------------------------------------------------------------------------

- (void)configFirstBage:(NSString *)bageNum;
- (void)configSecondBage:(NSString *)bageNum;
- (void)configThirdBage:(NSString *)bageNum;
- (void)configFourthBage:(NSString *)bageNum;
@end
