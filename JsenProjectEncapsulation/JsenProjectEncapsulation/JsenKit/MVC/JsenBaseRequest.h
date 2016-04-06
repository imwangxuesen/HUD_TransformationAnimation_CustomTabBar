//
//  JsenBaseRequest.h
//  JsenProjectEncapsulation
//
//  Created by WangXuesen on 16/4/6.
//  Copyright © 2016年 Jsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsenRequest.h"
@interface JsenBaseRequest : NSObject

//TODO : wxs
+ (id)requestWithName:(NSString *)name forServiceUrl:(NSString *)serviceURL requestMethod:(JRequestMethod)method responseParseFormat:(JResponseParseFormat)format params:(NSDictionary *)params success:(JsenRequestSuccess)success failed:(JsenRequestFailed)failed;
@end
