//
//  JsenBaseRequest.m
//  JsenProjectEncapsulation
//
//  Created by WangXuesen on 16/4/6.
//  Copyright © 2016年 Jsen. All rights reserved.
//

#import "JsenRequestClient.h"
#import "JsenRequestParamsModelManager.h"
#import "JsenLoginModel.h"
@implementation JsenRequestClient


+ (JsenRequestClient *)shareClient {
    
    static JsenRequestClient * client;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        client = [[JsenRequestClient alloc] init];
    });
    return client;
}

#pragma mark - Request Method


- (id)requestWithName:(NSString *)name success:(JsenRequestSuccess)success failed:(JsenRequestFailed)failed {
    
    JsenRequestParamsModel * paramsModel = [[JsenRequestParamsModelManager shared] getRequestModel:name];
    
    JsenRequest * request = [JsenRequest requestWithName:paramsModel.requestName forServiceUrl:paramsModel.subRequestURL requestMethod:paramsModel.requestMethod responseParseFormat:paramsModel.responseParseFormat params:paramsModel.params success:^(JsenRequest *request, JRequestingStatus requestingStatus, JsenRequestResponseSuccess *responseSuccess) {
        
        id model = [self transfor:responseSuccess modelClass:paramsModel.modelClass];
        responseSuccess.model = model;
        success(request,requestingStatus,responseSuccess);
        
        NSLog(@"base request success ");
    } failed:^(JsenRequest *request, JRequestingStatus requestingStatus, JsenRequestResponseFailure *responseFailed) {
        NSLog(@"base request fail ");
    }];
    [request start];
    
    return nil;
}

- (id)transfor:(JsenRequestResponseSuccess *)success modelClass:(Class)modelClass{
    return [modelClass yy_modelWithJSON:success.userInfo[@"data"]];
//    return [modelClass yy_modelWithDictionary:];
}

#pragma mark - config Method



@end
