//
//  JsenRequest.h
//  美妆嘉人
//
//  Created by WangXuesen on 15/12/1.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsenRequestResponseFailure.h"
#import "JsenRequestResponseSuccess.h"
#import "NSDictionary+Expansion.h"
//响应状态
typedef enum{
    JRequestStatusFail      = 0,
    JRequestStatusSuccess   = 1,
} JRequestResponseStatus;

//错误
typedef enum{
    JRequestErrorCodeTimeOut        = 256,
    JRequestErrorCodeNotFound       = 404,
    JRequestErrorCodeServerError    = 500,
} JRequestErrorCode;

//请求方式
typedef enum{
    JRequestMethodGet           = 1,
    JRequestMethodPost          = 2,
    JRequestMethodMultipartPost = 3,
    JRequestMethodPut           = 4,
} JRequestMethod;

//响应数据类型
typedef enum{
   JResponseParseFormatJSON = 0,
   JResponseParseFormatXML  = 1,
    
} JResponseParseFormat;

//请求状态
typedef enum{
    JRequestingStatusStarted  = 0,
    JRequestingStatusCanceled = 1,
    JRequestingStatusFinished = 2,
    JRequestingStatusFailed   = 3,
} JRequestingStatus;


#pragma mark － JsenRequestDelegate
@class JsenRequestResponseFailure,JsenRequestResponseSuccess;
@protocol JsenRequestDelegate <NSObject>
@required
- (void)requestDidStarted:(NSString *)serviceName;
- (void)requestDidCanceled:(NSString *)serviceName;
- (void)requestDidFinished:(JsenRequestResponseSuccess *)response;
- (void)requestDidFailed:(JsenRequestResponseFailure *)response;
@end


@interface JsenRequest : NSObject

typedef void(^JsenRequestBlockHandler)(JsenRequest * request, JRequestingStatus requestingStatus, JsenRequestResponseSuccess *responseSuccess, JsenRequestResponseFailure *responseFailed);

@property (nonatomic , weak) id<JsenRequestDelegate>delegate;
@property (nonatomic , strong) JsenRequestBlockHandler requestHandler;
@property (nonatomic , copy) NSString * requestName;
@property (nonatomic , copy) NSString * requestURL;
@property (nonatomic , assign) JResponseParseFormat responseParseFormat;
@property (nonatomic , assign) JRequestMethod requestMethod;
@property (nonatomic , strong) NSDictionary *params;

- (void)start;
- (void)cancel;

+ (id)requestWithName:(NSString *)name forServiceUrl:(NSString *)serviceURL requestMethod:(JRequestMethod)method responseParseFormat:(JResponseParseFormat)format params:(NSDictionary *)params;

+ (id)requestWithName:(NSString *)name forServiceUrl:(NSString *)serviceURL requestMethod:(JRequestMethod)method responseParseFormat:(JResponseParseFormat)format params:(NSDictionary *)params withRequestBlock:(JsenRequestBlockHandler)customerBlock;

+ (id)requestWithName:(NSString *)name forServiceUrl:(NSString *)serviceURL requestMethod:(JRequestMethod)method responseParseFormat:(JResponseParseFormat)format params:(NSDictionary *)params withDelegate:(id<JsenRequestDelegate>) delegate;

@end
