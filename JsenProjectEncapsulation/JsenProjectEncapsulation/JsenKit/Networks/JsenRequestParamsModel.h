//
//  JsenRequestParamsModel.h
//  JsenProjectEncapsulation
//
//  Created by WangXuesen on 16/4/7.
//  Copyright © 2016年 Jsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsenRequest.h"
@interface JsenRequestParamsModel : NSObject

/**
 *  公共参数
 */
@property (nonatomic , strong) NSDictionary * publishParams;

/**
 *  请求 子url
 */
@property (nonatomic , copy) NSString * subRequestURL;

/**
 *  请求方式
 */
@property (nonatomic , assign) JRequestMethod requestMethod;

/**
 *  返回的数据格式
 */
@property (nonatomic , assign) JResponseParseFormat responseParseFormat;

/**
 *  成功解析的model class
 */
@property (nonatomic , strong) Class modelClass;


/**
 *  请求参数
 */
@property (nonatomic , strong) NSMutableDictionary * params;

/**
 *  请求名字
 */
@property (nonatomic , strong) NSString * requestName;


/**
 *  初始化一个request params model
 *
 *  @param method     请求方式 get post put malitpart
 *  @param name       请求名称 nsstring
 *  @param subUrl     子url nsstring
 *  @param modelClass 数据模型的class
 *  @param params     请求参数 nsmutabledictionary
 *
 *  @return JsenRequestParamsModel
 */
- (instancetype)initWithRequestMethod:(JRequestMethod)method
                                 name:(NSString *)name
                               subUrl:(NSString *)subUrl
                           modelClass:(Class)modelClass
                               params:(NSMutableDictionary *)params;
@end
