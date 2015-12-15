//
//  JsenRequestResponseSuccess.m
//  美妆嘉人
//
//  Created by WangXuesen on 15/12/1.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import "JsenRequestResponseSuccess.h"

@implementation JsenRequestResponseSuccess

- (id)initWithResponse:(NSDictionary *)responseDic {
    
    NSAssert(responseDic != nil, @"JsenRequestResponseSuccess' init data Dictionary is empty");
    self = [super init];
    if (self) {
        self.serviceName = responseDic[@"serviceName"];
        self.status = responseDic[@"status"];
        self.userInfo = responseDic[@"userInfoDic"];
    }
    return self;
}

@end
