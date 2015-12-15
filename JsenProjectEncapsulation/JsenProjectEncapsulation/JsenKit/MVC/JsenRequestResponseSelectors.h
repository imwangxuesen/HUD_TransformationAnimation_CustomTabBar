//
//  JsenRequestResponseSelectors.h
//  HearstMCB
//
//  Created by WangXuesen on 15/12/10.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsenRequestResponseSelectors : NSObject
@property (nonatomic , assign)SEL didStartedSEL;
@property (nonatomic , assign)SEL didCanceledSEL;
@property (nonatomic , assign)SEL didFinishedSEL;
@property (nonatomic , assign)SEL didFailedSEL;

+ (id)getResponsSelectorsWithStart:(SEL)start cancel:(SEL)cancel fail:(SEL)fail finish:(SEL)finish;
@end
