//
//  JsenLoginModel.h
//  JsenProjectEncapsulation
//
//  Created by WangXuesen on 16/4/7.
//  Copyright © 2016年 Jsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYModel.h"
@class JsenMessageModel,JsenVariablesModel;
@interface JsenLoginModel : NSObject<NSCoding, NSCopying>

@property (nonatomic , copy)NSString * Charset;

@property (nonatomic , strong)JsenVariablesModel * Variables;

@property (nonatomic , strong)JsenMessageModel * Message;

@property (nonatomic , copy)NSString *Version;

@end
