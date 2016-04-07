//
//  ViewController.m
//  JsenProjectEncapsulation
//
//  Created by WangXuesen on 15/12/15.
//  Copyright © 2015年 Jsen. All rights reserved.
//


#import "ViewController.h"
#import "JsenModel.h"
#import "JsenRequestClient.h"
#import "JsenTabBarItem.h"
#import "JsenTabBarItemMgr.h"
#import "JsenTabBarItemAttribute.h"
@interface ViewController ()<JsenModelDelegate,JsenBaseModelDelegate>
@property (nonatomic , strong)JsenModel * jsenModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.jsenModel = [[JsenModel alloc] init];
    self.jsenModel.modelDelegate = self;
    self.jsenModel.delegate = self;
    NSMutableDictionary *home_dict = [[NSMutableDictionary alloc] init];
    [home_dict setObject:@""       forKey:@"fromdateline"];
    [home_dict setObject:@""       forKey:@"todateline"];
    [home_dict setObject:@"0"      forKey:@"page"];
    [home_dict setObject:@"20"     forKey:@"perpage"];
    
    NSDictionary *params = @{
                             @"username"    :@"wangxuesen",
                             @"password"    :@"123456",
                             @"loginsubmit" :@"ture"
                             };
    
    
    [self.jsenModel docallLoginRequest:params];
    [self.jsenModel docallHomeRequest:home_dict];
    
    
    JsenRequest * request = [JsenRequest requestWithName:@"test1" forServiceUrl:Home requestMethod:JRequestMethodPost responseParseFormat:JResponseParseFormatJSON params:home_dict success:^(JsenRequest *request, JRequestingStatus requestingStatus, JsenRequestResponseSuccess *responseSuccess) {
        NSLog(@"home ------ success ------ :%@",responseSuccess.userInfo);
    } failed:^(JsenRequest *request, JRequestingStatus requestingStatus, JsenRequestResponseFailure *responseFailed) {
        NSLog(@"home ------ Failure ------ :%@",responseFailed);
    }];
    [request start];
    
    
    [[JsenRequestClient shareClient] requestWithName:@"requestLoginModel" success:^(JsenRequest *request, JRequestingStatus requestingStatus, JsenRequestResponseSuccess *responseSuccess) {
        NSLog(@"requestLoginModel success");
    } failed:^(JsenRequest *request, JRequestingStatus requestingStatus, JsenRequestResponseFailure *responseFailed) {
        NSLog(@"requestLoginModel failure");
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - JsenBaseModelDelegate
- (void)homeRequestStarted:(id)obj {
    JSENLOGINFO(@"home1 homeRequestStarted");
}

- (void)homeRequestCanceled:(JsenRequestResponseFailure *)jsenFail {
    JSENLOGINFO(@"home1 homeRequestCanceled");
}

- (void)homeRequestFailed:(JsenRequestResponseFailure *)jsenFail {
    JSENLOGINFO(@"home1 homeRequestFailed");
}

- (void)homeRequestFinished:(JsenRequestResponseSuccess *)suceess {
    JSENLOGINFO(@"home1 homeRequestFinished");
    
}

- (void)loginRequestStarted:(id)obj {
    JSENLOGINFO(@"login loginRequestStarted");
}

- (void)loginRequestCanceled:(JsenRequestResponseFailure *)jsenFail {
    JSENLOGINFO(@"login loginRequestCanceled");
    
}

- (void)loginRequestFailed:(JsenRequestResponseFailure *)jsenFail {
    JSENLOGINFO(@"login loginRequestFailed");
}

- (void)loginRequestFinished:(JsenRequestResponseSuccess *)suceess {
    NSDictionary *dic = (NSDictionary *)suceess.userInfo;
    NSDictionary *dat = dic[@"data"];
    NSDictionary *var = dat[@"Variables"];
    NSString *forhash = var[@"formhash"];
    
    JSENLOGINFO(@"login loginRequestFinished");
    [USER_DEFAULT setObject:forhash forKey:@"forhash"];
    [USER_DEFAULT synchronize];
    
    
    NSDictionary *paramsup = @{@"avatarsubmit":@"yes",
                               @"formhash"    :[USER_DEFAULT objectForKey:@"forhash"],
                               @"img_avatar"  :[UIImage imageNamed:@"img_avatar.png"],
                               };
    
    [self.jsenModel docallUploadHeaderRequest:paramsup];
}

- (void)uploadHeaderRequestFinished:(JsenRequestResponseSuccess *)success {
    JSENLOGINFO(@"uploadHeader success");

    
}

- (void)uploadHeaderRequestFailed:(JsenRequestResponseFailure *)failure {
    
    JSENLOGINFO(@"uploadHeader failure");
}

@end