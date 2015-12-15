//
//  JsenBaseModel.m
//  HearstMCB
//
//  Created by WangXuesen on 15/12/4.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import "JsenBaseModel.h"

@interface JsenBaseModel()<JsenRequestDelegate>


@end

@implementation JsenBaseModel

#pragma mark -
#pragma mark -  Request with block

- (void)docallRequest:(NSString *)requestName
        forServiceUrl:(NSString *)serviceUrl
        requestMethod:(JRequestMethod)requestMethod
  responseParseFormat:(JResponseParseFormat)responseParseFormat
               params:params
    responseSelectors:(JsenRequestResponseSelectors *)selectors{
    
    JsenRequest * request = [JsenRequest requestWithName:requestName
                                           forServiceUrl:serviceUrl
                                           requestMethod:requestMethod
                                     responseParseFormat:responseParseFormat
                                                  params:params
                                        withRequestBlock:^(JsenRequest *request, JRequestingStatus requestingStatus, JsenRequestResponseSuccess *responseSuccess, JsenRequestResponseFailure *responseFailed) {
        switch (requestingStatus) {
            case JRequestingStatusStarted:
                if (self.modelDelegate &&[self.modelDelegate respondsToSelector:selectors.didStartedSEL]) {
                    [self.modelDelegate performSelector:selectors.didStartedSEL withObject:nil];
                }
                break;
            case JRequestingStatusCanceled:
                if (self.modelDelegate &&[self.modelDelegate respondsToSelector:selectors.didCanceledSEL]) {
                    [self.modelDelegate performSelector:selectors.didCanceledSEL withObject:responseFailed];
                }
                break;
            case JRequestingStatusFailed:
                if (self.modelDelegate &&[self.modelDelegate respondsToSelector:selectors.didFailedSEL]) {
                    [self.modelDelegate performSelector:selectors.didFailedSEL withObject:responseFailed];
                }
                break;
            case JRequestingStatusFinished:
                if (self.modelDelegate &&[self.modelDelegate respondsToSelector:selectors.didFinishedSEL]) {
                    [self.modelDelegate performSelector:selectors.didFinishedSEL withObject:responseSuccess];
                }
                break;
                
            default:
                break;
        }
        
    }];
    [request start];
}

#pragma mark -
#pragma mark -  Request with delegate

- (void)docallRequestUseDelegate:(NSString *)requestName
                   forServiceUrl:(NSString *)serviceUrl
                   requestMethod:(JRequestMethod)requestMethod
             responseParseFormat:(JResponseParseFormat)responseParseFormat
                          params:params
               responseSelectors:(JsenRequestResponseSelectors *)selectors {
    JsenRequest * request = [JsenRequest requestWithName:requestName
                                           forServiceUrl:serviceUrl
                                           requestMethod:requestMethod
                                     responseParseFormat:responseParseFormat
                                                  params:params
                                            withDelegate:self];
    [request start];
    
}





@end
