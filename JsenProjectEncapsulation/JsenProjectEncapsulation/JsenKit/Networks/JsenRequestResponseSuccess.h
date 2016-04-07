//
//  JsenRequestResponseSuccess.h
//  美妆嘉人
//
//  Created by WangXuesen on 15/12/1.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsenRequestProtocol.h"

@interface JsenRequestResponseSuccess : NSObject

@property(nonatomic, strong) NSString *serviceName;
@property(nonatomic, strong) NSString *status;
@property(nonatomic, strong) id userInfo;
@property(nonatomic, strong) id model;

- (id)initWithResponse:(NSDictionary *)responseDic;

@end
