//
//  JsenValidationKit.h
//  HearstMCB
//
//  Created by WangXuesen on 15/12/14.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsenValidationKit : NSObject
/**
 *  判断值是否为null nil @“”
 *
 *  @param value id（对象类型）
 *
 *  @return yes是“空”的   no不是“空”的
 */
+ (BOOL)isValueEmpty:(id)value;

// 对网络请求后含有空字符串或字段为空的字段进行处理
+ (NSMutableDictionary *)isUnEmptyDict:(NSDictionary *)dict;


/**
 *  判断是否符合邮箱格式
 *
 *  @param email 需要检测的字符串
 *
 *  @return yes是email no不符合邮箱格式
 */
+ (BOOL)doCheckEmailFormat:(NSString *)email;

/**
 *  判断是否符合手机号码格式
 *
 *  @param phoneNumber 需要检测的字符串
 *
 *  @return yes符合手机号码格式  no不符合邮箱格式
 */
+ (BOOL)doCheckMobilePhoneNumber:(NSString *)phoneNumber;

/**
 *  判断是否符合美国身份id
 *
 *  @param idNumber 需要检测的id字符串
 *
 *  @return yes符合格式 no不符合格式
 */
+ (BOOL)doCheckIdNumber:(NSString *)idNumber;

/**
 *  判断是否符合中国护照号
 *
 *  @param passportNumber 需要检测的字符串
 *
 *  @return yes符合护照号格式  no不符合护照号格式
 */
+ (BOOL)doCheckPassportNumber:(NSString *)passportNumber;

/**
 *  判断是否符合url格式
 *
 *  @param url 需要检测的字符串
 *
 *  @return yes符合url格式 no 不符合url格式
 */
+ (BOOL)doCheckURL:(NSString *)url;

/**
 *
 *
 *  @param passport
 *
 *  @return
 */
+ (BOOL)doPassport:(NSString *)passport;


/**
 *  判断是否符合float格式
 *
 *  @param strNumber 需要检测的字符串
 *
 *  @return yes 符合  no 不符合
 */
+ (BOOL)doCheckFloatNumber:(NSString *)strNumber;
+ (BOOL)doCheckDigitalNumber:(NSString *)strNumber;

+ (BOOL)doCheckPassword:(NSString *)pwdStr;
@end
