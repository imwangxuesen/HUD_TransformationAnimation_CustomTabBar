//
//  JsenVariablesModel.h
//  JsenProjectEncapsulation
//
//  Created by WangXuesen on 16/4/7.
//  Copyright © 2016年 Jsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYModel.h"
@interface JsenVariablesModel : NSObject<NSCopying,NSCoding>
@property (nonatomic , copy)NSString *auth;
@property (nonatomic , copy)NSString *cookiepre;
@property (nonatomic , copy)NSString *formhash;
@property (nonatomic , copy)NSString *member_avatar;
@property (nonatomic , copy)NSString *member_uid;
@property (nonatomic , copy)NSString *member_username;
@property (nonatomic , copy)NSString *saltkey;
@end
