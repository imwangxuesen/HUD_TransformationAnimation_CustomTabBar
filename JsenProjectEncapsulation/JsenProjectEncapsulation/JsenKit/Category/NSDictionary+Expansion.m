//
//  NSDictionary+Expansion.m
//  HearstMCB
//
//  Created by WangXuesen on 15/12/2.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import "NSDictionary+Expansion.h"

@implementation NSDictionary (Expansion)
- (NSString *)SplicingNetParams {
    
    if (self.count != 0 && self != nil) {
        NSMutableString * paramStr = [[NSMutableString alloc] init];
        for (id obj in self) {
            [paramStr appendFormat:@"%@=%@&",obj,[self valueForKey:obj]];
        }
        [paramStr deleteCharactersInRange:NSMakeRange([paramStr length]-1, 1)];
        return paramStr;
    }
    return @"";
}
@end
