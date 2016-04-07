//
//  JsenRequestParamsModelManager.m
//  JsenProjectEncapsulation
//
//  Created by WangXuesen on 16/4/7.
//  Copyright © 2016年 Jsen. All rights reserved.
//

#import "JsenRequestParamsModelManager.h"
#import "JsenLoginModel.h"
@implementation JsenRequestParamsModelManager

#pragma mark - Public Method
+ (JsenRequestParamsModelManager *)shared {
    
    static JsenRequestParamsModelManager * mgr;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mgr = [[JsenRequestParamsModelManager alloc] init];
    });
    return mgr;
}

- (JsenRequestParamsModel *)getRequestModel:(NSString *)name {
    
    return [self valueForKeyPath:name];
}


#pragma mark - Private Method

#pragma mark - Getter 


- (JsenRequestParamsModel *)requestLoginModel {
    if (!_requestLoginModel) {
        _requestLoginModel = [[JsenRequestParamsModel alloc] initWithRequestMethod:JRequestMethodPost
                                                                              name:@"lllllll"
                                                                            subUrl:Login
                                                                        modelClass:[JsenLoginModel class]
                                                                            params:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"username",@"wangxuesen"
                                                                                                            ,@"password",@"123456"
                                                                                                            ,@"loginsubmit" ,@"ture", nil]];
    }
    return _requestLoginModel;
}
@end
