//
//  JsenRequestProtocol.h
//  美妆嘉人
//
//  Created by WangXuesen on 15/12/1.
//  Copyright © 2015年 hearst. All rights reserved.
//

#ifndef JsenRequestProtocol_h
#define JsenRequestProtocol_h

@protocol JsenRequestProtocol <NSObject>

@required
@property(nonatomic, copy) NSString *serviceName;
@property(nonatomic, copy) NSString *status;
@property(nonatomic, strong) id userInfo;

- (id)initWithResponse:(NSDictionary *)responseDic;

@optional
@property(nonatomic, copy) NSString *errorInfo;

@end

#endif /* JsenRequestProtocol_h */
