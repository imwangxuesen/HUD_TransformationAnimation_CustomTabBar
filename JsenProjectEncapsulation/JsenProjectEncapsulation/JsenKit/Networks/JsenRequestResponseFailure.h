//
//  JsenRequestResponseFailure.h
//  美妆嘉人
//
//  Created by WangXuesen on 15/12/1.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsenRequestProtocol.h"

@interface JsenRequestResponseFailure : NSObject<JsenRequestProtocol>

@property (nonatomic , copy) NSString *serviceName;
@property (nonatomic , copy) NSString *status;
@property (nonatomic , strong) id userInfo;
@property (nonatomic , copy) NSString *errorInfo;

- (id)initWithResponse:(NSDictionary *)responseDic;


@end
