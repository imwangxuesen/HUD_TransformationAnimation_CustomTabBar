//
//  Services.h
//  美妆嘉人
//
//  Created by WangXuesen on 15/12/1.
//  Copyright © 2015年 hearst. All rights reserved.
//

#ifndef Services_h
#define Services_h


//****************************************************************************************************************//
//************************************************ Http Settings  ************************************************//
//****************************************************************************************************************//


/**
 *  为1，切换到生产环境，其它，切换到测试环境
 *
 *  @return 生产，测试 的baseurl
 */
#define APP_PRODUCTION_ENVIRONMENT      1

/**
 *  http请求超时时间 （s）
 *
 */
#define Service_TimeOut       30

/**
 *  生产环境baseurl
 *
 */
#define Domain_Online_BaseURL @"http://bbs.mcchina.com/"

/**
 *  测试环境baseurl
 *
 */
#define Domain_Test_BaseURL   @"http://116.236.249.249/mcbbe/"

/**
 *  根据APP_PRODUCTION_ENVIRONMENT切换到我们预设置的baseurl
 *
 */
#define Domain_Ture_BaseURL   (APP_PRODUCTION_ENVIRONMENT == 1 ? Domain_Online_BaseURL : Domain_Test_BaseURL)

/**
 *  当前环境下的请求接口
 *
 *  @param interface 子接口的宏
 *
 */
#define Domain_Sub_Interface(interface) ([NSString stringWithFormat:@"%@%@",Domain_Ture_BaseURL,interface])


//****************************************************************************************************************//
//************************************************ Sub Interface  ************************************************//
//****************************************************************************************************************//

//example

#define Home @"api/mobile/index.php?module=homepagelist&nbp=1"
#define Login @"api/mobile/index.php?module=login&nbp=1"
#define UploadHeader @"api/mobile/index.php?module=updateprofile&nbp=1"

#endif /* Services_h */
