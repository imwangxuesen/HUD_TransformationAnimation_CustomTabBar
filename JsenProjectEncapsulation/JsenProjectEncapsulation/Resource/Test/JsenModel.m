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
    
    
//    [self docallRequest:HomeRequestName
//          forServiceUrl:Home
//          requestMethod:JRequestMethodGet
//    responseParseFormat:JResponseParseFormatJSON
//                 params:params
//      responseSelectors:[JsenRequestResponseSelectors getResponsSelectorsWithStart:@selector(homeRequestStarted:)
//                                                                            cancel:@selector(homeRequestCanceled:)
//                                                                              fail:@selector(homeRequestFailed:)
//                                                                            finish:@selector(homeRequestFinished:)]];
  
    [self docallRequestUseDelegate:HomeRequestName
          forServiceUrl:Home
          requestMethod:JRequestMethodGet
    responseParseFormat:JResponseParseFormatJSON
                 params:params
      responseSelectors:[JsenRequestResponseSelectors getResponsSelectorsWithStart:@selector(homeRequestStarted:) cancel:@selector(homeRequestCanceled:) fail:@selector(homeRequestFailed:) finish:@selector(homeRequestFinished:)]];
    
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
    
//    JsenRequest *request = [JsenRequest requestWithName:UploadHeaderRequestName forServiceUrl:UploadHeader requestMethod:JRequestMethodMultipartPost responseParseFormat:JResponseParseFormatJSON params:params withRequestBlock:^(JsenRequest *request, JRequestingStatus requestingStatus, JsenRequestResponseSuccess *responseSuccess, JsenRequestResponseFailure *responseFailed) {
//        switch (requestingStatus) {
//            case JRequestingStatusStarted:
//                if (self.modelDelegate &&[self.modelDelegate respondsToSelector:@selector(uploadHeaderRequestStarted)]) {
//                    [self.modelDelegate performSelector:@selector(uploadHeaderRequestStarted) withObject:nil];
//                }
//                break;
//            case JRequestingStatusCanceled:
//                if (self.modelDelegate &&[self.modelDelegate respondsToSelector:@selector(uploadHeaderRequestCanceled:)]) {
//                    [self.modelDelegate performSelector:@selector(uploadHeaderRequestCanceled:) withObject:responseFailed];
//                }
//                break;
//            case JRequestingStatusFailed:
//                if (self.modelDelegate &&[self.modelDelegate respondsToSelector:@selector(uploadHeaderRequestFailed:)]) {
//                    [self.modelDelegate performSelector:@selector(uploadHeaderRequestFailed:) withObject:responseFailed];
//                }
//                break;
//            case JRequestingStatusFinished:
//                if (self.modelDelegate &&[self.modelDelegate respondsToSelector:@selector(uploadHeaderRequestFinished:)]) {
//                    [self.modelDelegate performSelector:@selector(uploadHeaderRequestFinished:) withObject:responseSuccess];
//                }
//                break;
//                
//            default:
//                break;
//        }
//
//    }];
//    [request start];
}


#pragma mark - 
- (void)requestDidStarted:(NSString *)serviceName{
    if ([serviceName isEqualToString:HomeRequestName] && self.delegate && [self.delegate respondsToSelector:@selector(homeRequestStarted:)]) {
        [self.delegate performSelector:@selector(homeRequestStarted:) withObject:nil];
    }
}

- (void)requestDidCanceled:(NSString *)serviceName{
    if ([serviceName isEqualToString:HomeRequestName] && self.delegate && [self.delegate respondsToSelector:@selector(homeRequestCanceled:)]) {
        [self.delegate performSelector:@selector(homeRequestCanceled:) withObject:nil];
    }}
- (void)requestDidFinished:(JsenRequestResponseSuccess *)response{
    if ([response.serviceName isEqualToString:HomeRequestName] && self.delegate && [self.delegate respondsToSelector:@selector(homeRequestFinished:)]) {
        [self.delegate performSelector:@selector(homeRequestFinished:) withObject:nil];
    }else if ([response.serviceName isEqualToString:UploadHeaderRequestName] && self.delegate && [self.delegate respondsToSelector:@selector(uploadHeaderRequestFinished:)]) {
        [self.delegate performSelector:@selector(uploadHeaderRequestFinished:) withObject:nil];
    }
    
}

- (void)requestDidFailed:(JsenRequestResponseFailure *)response{
    if ([response.serviceName isEqualToString:HomeRequestName] && self.delegate && [self.delegate respondsToSelector:@selector(homeRequestFailed:)]) {
        [self.delegate performSelector:@selector(homeRequestFailed:) withObject:nil];
    } else if ([response.serviceName isEqualToString:UploadHeaderRequestName] && self.delegate && [self.delegate respondsToSelector:@selector(uploadHeaderRequestFailed:)]) {
        [self.delegate performSelector:@selector(uploadHeaderRequestFailed:) withObject:nil];
    }
}
@end
