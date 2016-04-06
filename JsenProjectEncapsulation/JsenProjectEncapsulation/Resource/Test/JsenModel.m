//
//  JsenModel.m
//  HearstMCB
//
//  Created by WangXuesen on 15/12/7.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import "JsenModel.h"


#define HomeRequestName  @"Home_Request_Name"
#define LoginRequestName @"Login_Request_Name"
#define UploadHeaderRequestName @"Upload_Header_Request_Name"

@interface JsenModel()<JsenRequestDelegate>

@end

@implementation JsenModel

- (void)docallHomeRequest:(NSDictionary *)params {
    
    [self docallRequestUseDelegate:HomeRequestName
          forServiceUrl:Home
          requestMethod:JRequestMethodGet
    responseParseFormat:JResponseParseFormatJSON
                 params:params
      responseSelectors:[JsenRequestResponseSelectors getResponsSelectorsWithStart:@selector(homeRequestStarted:)
                                                                            cancel:@selector(homeRequestCanceled:)
                                                                              fail:@selector(homeRequestFailed:)
                                                                            finish:@selector(homeRequestFinished:)]];
    
}

- (void)docallLoginRequest:(NSDictionary *)params {
    [self docallRequest:LoginRequestName
          forServiceUrl:Login
          requestMethod:JRequestMethodPost
    responseParseFormat:JResponseParseFormatJSON
                 params:params
      responseSelectors:[JsenRequestResponseSelectors getResponsSelectorsWithStart:@selector(loginRequestStarted:)
                                                                            cancel:@selector(loginRequestCanceled:)
                                                                              fail:@selector(loginRequestFailed:)
                                                                            finish:@selector(loginRequestFinished:)]];
    
}


#warning upload file api have some problem.
//TODO:wxs
- (void)docallUploadHeaderRequest:(NSDictionary *)params {
    
    
    [self docallRequest:UploadHeaderRequestName
          forServiceUrl:UploadHeader
          requestMethod:JRequestMethodMultipartPost
    responseParseFormat:JResponseParseFormatJSON
                 params:params
      responseSelectors:[JsenRequestResponseSelectors getResponsSelectorsWithStart:@selector(uploadHeaderRequestStarted:)
                                                                            cancel:@selector(uploadHeaderRequestCanceled:)
                                                                              fail:@selector(uploadHeaderRequestFailed:)
                                                                            finish:@selector(uploadHeaderRequestFinished:)]];
    
}


#pragma mark - 
- (void)requestDidStarted:(NSString *)serviceName{
    if ([serviceName isEqualToString:HomeRequestName] && self.delegate && [self.delegate respondsToSelector:@selector(homeRequestStarted:)]) {
        [self.delegate performSelector:@selector(homeRequestStarted:) withObject:serviceName];
    }
}

- (void)requestDidCanceled:(NSString *)serviceName{
    if ([serviceName isEqualToString:HomeRequestName] && self.delegate && [self.delegate respondsToSelector:@selector(homeRequestCanceled:)]) {
        [self.delegate performSelector:@selector(homeRequestCanceled:) withObject:serviceName];
    }
}

- (void)requestDidFinished:(JsenRequestResponseSuccess *)response{
    if ([response.serviceName isEqualToString:HomeRequestName] && self.delegate && [self.delegate respondsToSelector:@selector(homeRequestFinished:)]) {
        [self.delegate performSelector:@selector(homeRequestFinished:) withObject:response];
    }else if ([response.serviceName isEqualToString:UploadHeaderRequestName] && self.delegate && [self.delegate respondsToSelector:@selector(uploadHeaderRequestFinished:)]) {
        [self.delegate performSelector:@selector(uploadHeaderRequestFinished:) withObject:response];
    }
    
}

- (void)requestDidFailed:(JsenRequestResponseFailure *)response{
    if ([response.serviceName isEqualToString:HomeRequestName] && self.delegate && [self.delegate respondsToSelector:@selector(homeRequestFailed:)]) {
        [self.delegate performSelector:@selector(homeRequestFailed:) withObject:response];
    } else if ([response.serviceName isEqualToString:UploadHeaderRequestName] && self.delegate && [self.delegate respondsToSelector:@selector(uploadHeaderRequestFailed:)]) {
        [self.delegate performSelector:@selector(uploadHeaderRequestFailed:) withObject:response];
    }
}
@end
