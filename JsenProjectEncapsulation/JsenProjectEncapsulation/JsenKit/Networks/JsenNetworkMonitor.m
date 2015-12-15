//
//  JsenNetworkMonitor.m
//  美妆嘉人
//
//  Created by WangXuesen on 15/12/1.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import "JsenNetworkMonitor.h"
#import "Reachability.h"
static JsenNetworkMonitor * singletonInstance = nil;

@interface JsenNetworkMonitor() {
    Reachability *_reachAbility;
    BOOL    _networkReachable;
    NSString *_networkType;
    
}

@end

@implementation JsenNetworkMonitor

- (id)init {
    self = [super init];
    if (self) {
        _networkReachable = YES;
        _networkType = nil;
    }
    return self;
}

#pragma mark - Public Methods
- (void)dealloc {
    [self removeObserver];
}

- (void)startNotifer {
    [self addObserver];
    _reachAbility = [Reachability reachabilityForInternetConnection];
    [self updateNetwordStatus:_reachAbility.currentReachabilityStatus];
    [_reachAbility startNotifier];
}

- (void)stopNotifier {
    [self removeObserver];
    if (_reachAbility) {
        [_reachAbility stopNotifier];
    }
}

- (BOOL)isReachable {
    return _networkReachable;
}

- (NSString *)getReadableTrafficInfo {
    return _networkType;
}

#pragma mark - Private Methods
- (void)networkStateDidChanged:(NSNotification*)n
{
    Reachability* curReach = [n object];
    NSParameterAssert([curReach isKindOfClass: [Reachability class]]);
    [self updateNetwordStatus:curReach.currentReachabilityStatus];
}

- (void)updateNetwordStatus:(NetworkStatus)status
{
    _networkReachable = YES;
    switch (status) {
        case ReachableViaWiFi:
        {
            _networkType = @"wifi";
        }
            break;
        case ReachableViaWWAN:
        {
            _networkType = @"wwan";
        }
            break;
        case NotReachable:
        {
            _networkType = @"unavailable";
            _networkReachable = NO;
        }
            break;
        default:
        {
            _networkReachable = NO;
            _networkType = @"unknown";
        }
            break;
    }
    
   
    JSENLOGPRINT(@"%@", _networkType);
}

- (void)addObserver {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkStateDidChanged:) name:kReachabilityChangedNotification object:nil];
}

- (void)removeObserver {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
}

#pragma mark - Class Methods
+ (JsenNetworkMonitor *)sharedInstance {
    @synchronized(self){
        if (!singletonInstance) {
            singletonInstance = [[JsenNetworkMonitor alloc] init];
        }
        return singletonInstance;
    }
    
    return nil;
}




@end
