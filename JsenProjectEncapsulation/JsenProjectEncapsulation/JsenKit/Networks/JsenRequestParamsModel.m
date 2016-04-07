//
//  JsenRequestParamsModel.m
//  JsenProjectEncapsulation
//
//  Created by WangXuesen on 16/4/7.
//  Copyright © 2016年 Jsen. All rights reserved.
//

#import "JsenRequestParamsModel.h"

@implementation JsenRequestParamsModel 

#pragma mark - Init

- (instancetype)initWithRequestMethod:(JRequestMethod)method name:(NSString *)name subUrl:(NSString *)subUrl modelClass:(Class)modelClass params:(NSMutableDictionary *)params
{
    self = [super init];
    if (self) {
        _requestMethod = method;
        _requestName = name;
        _subRequestURL = subUrl;
        _modelClass = modelClass;
        _params = params;
        
    }
    return self;
}

#pragma mark - Getter
- (NSDictionary *)publishParams {
    if (!_publishParams) {
        _publishParams = @{
                           @"uid":@"123"
                           };
    }
    return _publishParams;
    
}

- (NSMutableDictionary *)params {
    _params = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"123",@"456", nil];
    if (self.publishParams) {
        [_params addEntriesFromDictionary:self.publishParams];
    }
    return _params;
}


@end
