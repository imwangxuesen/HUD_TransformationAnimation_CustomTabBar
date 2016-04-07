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
typedef void(^JsenRequestSuccess)(JsenRequest * request, JRequestingStatus requestingStatus, JsenRequestResponseSuccess *responseSuccess);
typedef void(^JsenRequestFailed)(JsenRequest * request, JRequestingStatus requestingStatus, JsenRequestResponseFailure *responseFailed);

@property (nonatomic , weak)   id<JsenRequestDelegate> delegate;

@property (nonatomic , strong) JsenRequestBlockHandler requestHandler;
@property (nonatomic , strong) JsenRequestFailed       requestFailed;
@property (nonatomic , strong) JsenRequestSuccess      requestSuccess;
@property (nonatomic , assign) JResponseParseFormat    responseParseFormat;
@property (nonatomic , assign) JRequestMethod          requestMethod;
@property (nonatomic , copy  ) NSString                * requestName;
@property (nonatomic , copy  ) NSString                * requestURL;
@property (nonatomic , strong) NSDictionary            * params;
@property (nonatomic , strong) NSURLSessionUploadTask  * uploadTask;
@property (nonatomic , strong) NSURLSessionDataTask    * dataTask;

/**
 *  开始请求
 */
- (void)start;

/**
 *  取消请求
 */
- (void)cancel;

/**
 *  无代理参数请求方法（代理需要拿到实例子对象后再设置）
 *
 *  @param name       请求名字
 *  @param serviceURL 请求子URL
 *  @param method     JRequestMethod
 *  @param format     JResponseParseFormatJSON ／ JResponseParseFormatXML
 *  @param params     请求参数
 *
 *  @return JsenRequest 实例
 */
+ (id)requestWithName:(NSString *)name forServiceUrl:(NSString *)serviceURL requestMethod:(JRequestMethod)method responseParseFormat:(JResponseParseFormat)format params:(NSDictionary *)params;

/**
 *  代理形式请求方法
 *
 *  @param name       请求名字
 *  @param serviceURL 请求子URL
 *  @param method     JRequestMethod
 *  @param format     JResponseParseFormatJSON ／ JResponseParseFormatXML
 *  @param params     请求参数
 *
 *  @return JsenRequest 实例
 */
+ (id)requestWithName:(NSString *)name forServiceUrl:(NSString *)serviceURL requestMethod:(JRequestMethod)method responseParseFormat:(JResponseParseFormat)format params:(NSDictionary *)params withDelegate:(id<JsenRequestDelegate>) delegate;

/**
 *  block 形式请求方法
 *
 *  @param name       请求名字
 *  @param serviceURL 请求子URL
 *  @param method     JRequestMethod
 *  @param format     JResponseParseFormatJSON ／ JResponseParseFormatXML
 *  @param params     请求参数
 *  @param customerBlock 回调block ，成功、失败、状态、都会在这一个block中获取
 *
 *  @return JsenRequest 实例
 */
+ (id)requestWithName:(NSString *)name forServiceUrl:(NSString *)serviceURL requestMethod:(JRequestMethod)method responseParseFormat:(JResponseParseFormat)format params:(NSDictionary *)params withRequestBlock:(JsenRequestBlockHandler)customerBlock;

/**
 *  成功、失败 block回调方式的请求方法
 *
 *  @param name       请求名字
 *  @param serviceURL 请求子URL
 *  @param method     JRequestMethod
 *  @param format     JResponseParseFormatJSON ／ JResponseParseFormatXML
 *  @param params     请求参数
 *  @param success    成功的block回调
 *  @param failed     失败的block回调
 *
 *  @return JsenRequest 实例
 */
+ (id)requestWithName:(NSString *)name forServiceUrl:(NSString *)serviceURL requestMethod:(JRequestMethod)method responseParseFormat:(JResponseParseFormat)format params:(NSDictionary *)params success:(JsenRequestSuccess)success failed:(JsenRequestFailed)failed;

@end
