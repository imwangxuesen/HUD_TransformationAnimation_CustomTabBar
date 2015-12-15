//
//  JsenTabBarConfig.h
//  JsenProjectEncapsulation
//
//  Created by WangXuesen on 15/12/15.
//  Copyright © 2015年 Jsen. All rights reserved.
//

#ifndef JsenTabBarConfig_h
#define JsenTabBarConfig_h

/////////////////////////////////////////////////////////////////////
// title 字号大小
static const NSInteger TabBarItem_TitleFontSize     = 10;
// title label 的高度
static const CGFloat TabBarItem_TitleH              = 10;

/////////////////////////////////////////////////////////////////////
// 按钮的背景颜色
static const int   TabBarItem_BackgroundColor       = 0xffffff;
// 标题的背景颜色
static const int   TabBarItem_TitleBackgroundColor  = 0xffffff;
// 正常状态下标题的颜色
static const int   TabBarItem_TitleTextColor_Nor    = 0xe4dede;
// 选中状态下的标题颜色
static const int   TabBarItem_TitleTextColor_Sel    = 0xDC143C;
// 高亮状态下的标题颜色
static const int   TabBarItem_TitleTextColor_HL     = 0xDC143C;

/////////////////////////////////////////////////////////////////////
// image的宽高
static const CGFloat TabBarItem_ItemImageWH         = 25;
// image 和 title 之间的间距
static const CGFloat TabBarItem_ImageTextBorad      = 3;

/////////////////////////////////////////////////////////////////////
// bagelabel 的宽高（直径）
static const CGFloat TabBarItem_BageWH              = 14;
// bagelabel 的背景颜色
static const int     TabBarItem_BageBackgroundColor = 0xCC99090;
// bagelabel 的字体颜色
static const int     TabBarItem_BageTextColor       = 0xffffff;
// bagelabel 的字号
static const NSInteger TabBarItem_BageFontSize      = 9;

/////////////////////////////////////////////////////////////////////
// bagelabel 的字体名字
#define  TabBarItem_BageFontName  @"AppleGothic"
// 加号按钮的图片名字
#define  TabBarItem_BageFontName_PlusButtonImageName  @"tab_plus"

#endif /* JsenTabBarConfig_h */
