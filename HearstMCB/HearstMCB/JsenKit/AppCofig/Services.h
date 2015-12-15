//
//  Services.h
//  美妆嘉人
//
//  Created by WangXuesen on 15/12/1.
//  Copyright © 2015年 hearst. All rights reserved.
//

#ifndef Services_h
#define Services_h

#define APP_PRODUCTION_ENVIRONMENT      1

#define Service_TimeOut       30

#define Domain_Online_BaseURL @"http://bbs.mcchina.com/"
#define Domain_Test_BaseURL   @"http://116.236.249.249/mcbbe/"
#define Domain_Ture_BaseURL   (APP_PRODUCTION_ENVIRONMENT == 1 ? Domain_Online_BaseURL : Domain_Test_BaseURL)

#define Domain_Sub_Interface(interface) ([NSString stringWithFormat:@"%@%@",Domain_Ture_BaseURL,interface])


//** Sub Interface  **//
//example

#define Home @"api/mobile/index.php?module=homepagelist&nbp=1"
#define Login @"api/mobile/index.php?module=login&nbp=1"
#define UploadHeader @"api/mobile/index.php?module=updateprofile&nbp=1"

#endif /* Services_h */
