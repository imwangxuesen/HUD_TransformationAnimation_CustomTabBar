//
//  JsenValidationKit.m
//  HearstMCB
//
//  Created by WangXuesen on 15/12/14.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import "JsenValidationKit.h"

@implementation JsenValidationKit
/*
 * Functionality: check NSString, NSArray, NSDictionary is empty or not
 * @"", [], {}, are empty objects
 */
+ (BOOL)isValueEmpty:(id)value
{
    BOOL checkResult = NO;
    if (!value) {
        checkResult = YES;
        return checkResult;
    }
    if ([value isKindOfClass:[NSString class]] && ([value isEqualToString:@""] || [value isEqualToString:@"<null>"])) {
        checkResult = YES;
    } else if (([value isKindOfClass:[NSArray class]] || [value isKindOfClass:[NSDictionary class]]) && ![value count]) {
        checkResult = YES;
    } else if ([value isKindOfClass:[NSNull class]]) {
        checkResult = YES;
    }
    
    return checkResult;
}

+ (NSMutableDictionary *)isUnEmptyDict:(NSDictionary *)dict {
    NSArray *allKeysArray = [dict allKeys];
    NSMutableDictionary *my_dict = [[NSMutableDictionary alloc] init];
    for (int i = 0; i < allKeysArray.count; i++) {
        if ([JsenValidationKit isValueEmpty:dict[[allKeysArray objectAtIndex:i]]]) {
            [my_dict setObject:@"" forKey:[allKeysArray objectAtIndex:i]];
        } else {
            [my_dict setObject:dict[[allKeysArray objectAtIndex:i]] forKey:[allKeysArray objectAtIndex:i]];
        }
    }
    return my_dict;
}

+ (BOOL)doCheckEmailFormat:(NSString *)email
{
    BOOL checkResult = YES;
    
    checkResult = ![self isValueEmpty:email];
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    if (![emailTest evaluateWithObject:email]) {
        checkResult = NO;
    }
    
    return checkResult;
}

+ (BOOL)doCheckMobilePhoneNumber:(NSString *)phoneNumber {
    BOOL checkResult = YES;
    checkResult = ![self isValueEmpty:phoneNumber];
    
    if (checkResult) {
        NSString *mobilePhoneRegex = @"^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$";
        NSPredicate *mobilePhoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobilePhoneRegex];
        if (![mobilePhoneTest evaluateWithObject:phoneNumber]) {
            checkResult = NO;
        }
    }
    
    return checkResult;
}

+ (BOOL)doCheckPassportNumber:(NSString *)passportNumber {
    BOOL checkResult = YES;
    checkResult = ![self isValueEmpty:passportNumber];
    
    if (checkResult) {
        NSString *idRegex = @"(P[0-9]{7})|(G[0-9]{8})";
        NSPredicate *idTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", idRegex];
        if (![idTest evaluateWithObject:passportNumber]) {
            checkResult = NO;
        }
    }
    
    return checkResult;
}

+ (BOOL)doCheckIdNumber:(NSString *)idNumber {
    BOOL checkResult = YES;
    checkResult = ![self isValueEmpty:idNumber];
    
    if (checkResult) {
        NSString *idRegex = @"[0-9xX]{18}";
        NSPredicate *idTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", idRegex];
        if (![idTest evaluateWithObject:idNumber]) {
            checkResult = NO;
        }
    }
    
    return checkResult;
}

+ (BOOL)doPassport:(NSString *)passport{
    BOOL checkResult = YES;
    checkResult = ![self isValueEmpty:passport];
    
    if (checkResult) {
        NSString *idRegex = @"^(P\\d{7})|(G\\d{8})$";
        NSPredicate *idTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", idRegex];
        if (![idTest evaluateWithObject:passport]) {
            checkResult = NO;
        }
    }
    
    return checkResult;
}
+ (BOOL)doCheckURL:(NSString *)url
{
    BOOL checkResult = YES;
    checkResult = ![self isValueEmpty:url];
    
    if (checkResult) {
        //        NSString *urlRegex = @"((https|http|ftp|rtsp|mms)?://)?(([0-9a-z_!~*'().&=+$%-]+: )?[0-9a-z_!~*'().&=+$%-]+@)?(([0-9]{1,3}/.){3}[0-9]{1,3}|([0-9a-z_!~*'()-]+/.)*([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]/.[a-z]{2,6})(:[0-9]{1,4})?((/?)|(/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+/?)";
        
        //        (:[0-9]{1,4})?[A-Za-z0-9/.-]*
        NSString *urlRegex = @"(http|HTTP|ftp|FTP){1}(://){1}[0-9a-zA-Z/.-_]+(:[0-9]{1,4})?[0-9a-zA-Z/.-_]*";
        NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegex];
        if (![urlTest evaluateWithObject:url]) {
            checkResult = NO;
        }
    }
    
    return checkResult;
}

+ (BOOL)doCheckFloatNumber:(NSString *)strNumber
{
    BOOL checkResult = YES;
    
    if (checkResult) {
        NSString *idRegex = @"^([0-9]+)(.{0,1}[0-9]*)$";
        NSPredicate *idTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", idRegex];
        if (![idTest evaluateWithObject:strNumber]) {
            checkResult = NO;
        }
    }
    
    return checkResult;
}

+ (BOOL)doCheckDigitalNumber:(NSString *)strNumber {
    BOOL checkResult = YES;
    
    if (checkResult) {
        NSString *idRegex = @"^([0-9]+)$";
        NSPredicate *idTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", idRegex];
        if (![idTest evaluateWithObject:strNumber]) {
            checkResult = NO;
        }
    }
    
    return checkResult;
}

+ (BOOL)doCheckPassword:(NSString *)pwdStr {
    BOOL checkResult = YES;
    
    if (checkResult) {
        NSString *idRegex = @"^([A-Z0-9a-z]{6,})$";
        NSPredicate *idTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", idRegex];
        if (![idTest evaluateWithObject:pwdStr]) {
            checkResult = NO;
        }
    }
    
    return checkResult;
}

@end
