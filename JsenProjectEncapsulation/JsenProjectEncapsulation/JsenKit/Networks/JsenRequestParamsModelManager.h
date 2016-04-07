//
//  JsenRequestParamsModelManager.h
//  JsenProjectEncapsulation
//
//  Created by WangXuesen on 16/4/7.
//  Copyright © 2016年 Jsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsenRequestParamsModel.h"
@interface JsenRequestParamsModelManager : NSObject


/**
 *  登录的请求参数
 */
@property (nonatomic , strong)JsenRequestParamsModel * requestLoginModel;


+ (JsenRequestParamsModelManager *)shared;

- (JsenRequestParamsModel *)getRequestModel:(NSString *)name;

@end
