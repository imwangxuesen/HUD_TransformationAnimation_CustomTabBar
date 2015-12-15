//
//  Common.h
//  HearstMCB
//
//  Created by WangXuesen on 15/12/8.
//  Copyright © 2015年 hearst. All rights reserved.
//

#ifndef Common_h
#define Common_h

#define USER_DEFAULT [NSUserDefaults standardUserDefaults]

//颜色
#define UIColorFromRGB(rgbValue)            [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// EXAMPLE
#define BTN_ENABLE_BG_COLOR        UIColorFromRGB(0xAC0005)
#define BTN_DISABLE_BG_COLOR       UIColorFromRGB(0xD7D7D7)
#define BTN_ENABLE_TITLE_COLOR     UIColorFromRGB(0xFFFFFF)
#define BTN_DISABLE_TITLE_COLOR    UIColorFromRGB(0x000000)





#endif /* Common_h */
