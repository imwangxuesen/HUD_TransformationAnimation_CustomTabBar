//
//  JsenTabBarItemAttribute.h
//  HearstMCB
//
//  Created by WangXuesen on 15/12/13.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import "JsenTabBarItemAttribute.h"
@interface JsenTabBarItemAttribute : NSObject

@property (nonatomic , copy) NSString * attributeKey;//用作runtime添加和取得对应的item，建议和本属性名称相符
@property (nonatomic , copy) NSString * title;
@property (nonatomic , copy) NSString * imageNameForSel;
@property (nonatomic , copy) NSString * imageNameForNor;

- (instancetype)initWithTitle:(NSString *)title imageNameForSel:(NSString *)imageNameForSel imageNameForNor:(NSString *)imageNameForNor;

@end
