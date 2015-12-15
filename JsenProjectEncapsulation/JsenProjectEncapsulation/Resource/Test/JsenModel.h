//
//  JsenModel.h
//  HearstMCB
//
//  Created by WangXuesen on 15/12/7.
//  Copyright © 2015年 hearst. All rights reserved.
//


@protocol JsenModelDelegate <NSObject>


@end
#import <Foundation/Foundation.h>
#import "JsenModel.h"
#import "JsenBaseModel.h"

@interface JsenModel : JsenBaseModel

- (void)docallHomeRequest:(NSDictionary *)params;

- (void)docallLoginRequest:(NSDictionary *)params;

- (void)docallUploadHeaderRequest:(NSDictionary *)params;

@property (nonatomic , weak)id<JsenModelDelegate>delegate;
@end
