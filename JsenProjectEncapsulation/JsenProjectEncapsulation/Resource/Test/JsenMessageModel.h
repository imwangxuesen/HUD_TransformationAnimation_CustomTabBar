//
//  JsenMessageModel.h
//  JsenProjectEncapsulation
//
//  Created by WangXuesen on 16/4/7.
//  Copyright © 2016年 Jsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYModel.h"
@interface JsenMessageModel : NSObject<NSCoding,NSCopying>
@property (nonatomic , copy)NSString * messagepvl;
@property (nonatomic , copy)NSString * messagestr;
@property (nonatomic , copy)NSString * messageval;
@end
