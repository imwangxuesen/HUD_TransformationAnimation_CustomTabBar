//
//  JsenBaseModel.h
//  HearstMCB
//
//  Created by WangXuesen on 15/12/4.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsenBaseModel.h"
#import "JsenRequest.h"
#import "JsenRequestResponseSelectors.h"
@protocol JsenBaseModelDelegate <NSObject>

@end

@interface JsenBaseModel : NSObject
- (void)docallRequest:(NSString *)requestName
        forServiceUrl:(NSString *)serviceUrl
        requestMethod:(JRequestMethod)requestMethod
  responseParseFormat:(JResponseParseFormat)responseParseFormat
               params:params
    responseSelectors:(JsenRequestResponseSelectors *)selectors;


- (void)docallRequestUseDelegate:(NSString *)requestName
        forServiceUrl:(NSString *)serviceUrl
        requestMethod:(JRequestMethod)requestMethod
  responseParseFormat:(JResponseParseFormat)responseParseFormat
               params:params
    responseSelectors:(JsenRequestResponseSelectors *)selectors;
@property (nonatomic , weak) id<JsenBaseModelDelegate>modelDelegate;

@end
