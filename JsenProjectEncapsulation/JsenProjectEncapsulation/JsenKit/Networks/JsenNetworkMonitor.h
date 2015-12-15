//
//  JsenNetworkMonitor.h
//  美妆嘉人
//
//  Created by WangXuesen on 15/12/1.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsenNetworkMonitor : NSObject
- (void)startNotifer;
- (void)stopNotifier;
- (BOOL)isReachable;
- (NSString *)getReadableTrafficInfo;

// Class Methods
+ (JsenNetworkMonitor *)sharedInstance;
@end
