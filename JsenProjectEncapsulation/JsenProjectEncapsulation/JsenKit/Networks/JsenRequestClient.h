//
//  JsenBaseRequest.h
//  JsenProjectEncapsulation
//
//  Created by WangXuesen on 16/4/6.
//  Copyright © 2016年 Jsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsenRequest.h"


@interface JsenRequestClient : NSObject

+ (JsenRequestClient *)shareClient;

//TODO : wxs
- (nullable id)requestWithName:(nullable NSString *)name
                       success:(nullable JsenRequestSuccess)success
                        failed:(nullable JsenRequestFailed)failed;

@end
