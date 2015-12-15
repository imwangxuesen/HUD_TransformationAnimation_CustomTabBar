//
//  JsenLog.h
//  美妆嘉人
//
//  Created by WangXuesen on 15/12/1.
//  Copyright © 2015年 hearst. All rights reserved.
//

#ifndef JsenLog_h
#define JsenLog_h

#define JSENLOGPRINT(xx, ...)  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

#if APP_PRODUCTION_ENVIRONMENT == 0
#define JSENLOGINFO(xx, ...)  JSENLOGPRINT(xx, ##__VA_ARGS__)
#else
#define JSENLOGINFO(xx, ...)  ((void)0)
#endif


#endif /* JsenLog_h */
