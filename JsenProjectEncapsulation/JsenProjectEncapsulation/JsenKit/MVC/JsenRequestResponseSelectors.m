//
//  JsenRequestResponseSelectors.m
//  HearstMCB
//
//  Created by WangXuesen on 15/12/10.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import "JsenRequestResponseSelectors.h"

@implementation JsenRequestResponseSelectors
- (instancetype)initWithStart:(SEL)start cancel:(SEL)cancel fail:(SEL)fail finish:(SEL)finish
{
    self = [super init];
    if (self) {
        self.didCanceledSEL = cancel;
        self.didStartedSEL = start;
        self.didFailedSEL = fail;
        self.didFinishedSEL = finish;
    }
    return self;
}

+ (id)getResponsSelectorsWithStart:(SEL)start cancel:(SEL)cancel fail:(SEL)fail finish:(SEL)finish {
    
    JsenRequestResponseSelectors *selectors = [[JsenRequestResponseSelectors alloc] initWithStart:start cancel:cancel fail:fail finish:finish];
    return selectors;
}
@end
