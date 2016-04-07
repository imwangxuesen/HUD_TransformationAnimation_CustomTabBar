//
//  JsenRequest.m
//  美妆嘉人
//
//  Created by WangXuesen on 15/12/1.
//  Copyright © 2015年 hearst. All rights reserved.
//

#import "JsenRequest.h"

#define BOUNDARY @"AaB03x" //设置边界 参数可以随便设置

@interface JsenRequest()

@end

@implementation JsenRequest

#pragma mark - Public Method
- (void)start{
    NSAssert(![Domain_Ture_BaseURL isEqualToString:@""], @"Service root url is empty!!");
    [self requestDidStarted];
    switch (_requestMethod) {
        case JRequestMethodPost:
            [self startPostRequest];
            break;
        case JRequestMethodGet:
            [self startGetRequest];
            break;
        case JRequestMethodMultipartPost:
            [self startMultipartPost];
            break;
        case JRequestMethodPut:
            [self startPut];
            break;
            
        default:
            break;
    }
}

- (void)cancel{
    [self requestDidCanceled];
    switch (_requestMethod) {
        case JRequestMethodMultipartPost:
            [self.uploadTask cancel];
            break;
        
        case JRequestMethodGet:
            [self.dataTask cancel];
            break;
        
        case  JRequestMethodPost:
            [self.dataTask cancel];
            break;
            
        default:
            break;
    }
}


+ (id)requestWithName:(NSString *)name forServiceUrl:(NSString *)serviceURL requestMethod:(JRequestMethod)method responseParseFormat:(JResponseParseFormat)format params:(NSDictionary *)params{
    NSAssert(![serviceURL isEqualToString:@""] && serviceURL,  @"ServiceURL is empty!!");
    JsenRequest * request = [[JsenRequest alloc] init];
    request.requestURL          = [request fixRequestUrlWithServiceURL:serviceURL params:params];
    request.requestName         = name;
    request.requestMethod       = method;
    request.responseParseFormat = format;
    request.params = params;
    return  request;
}

+ (id)requestWithName:(NSString *)name forServiceUrl:(NSString *)serviceURL requestMethod:(JRequestMethod)method responseParseFormat:(JResponseParseFormat)format params:(NSDictionary *)params withDelegate:(id<JsenRequestDelegate>) delegate{
    NSAssert(![serviceURL isEqualToString:@""] && serviceURL,  @"ServiceURL is empty!!");
    JsenRequest * request = [[JsenRequest alloc] init];
    request.requestURL          = [request fixRequestUrlWithServiceURL:serviceURL params:params];
    request.requestName         = name;
    request.requestMethod       = method;
    request.responseParseFormat = format;
    request.params              = params;
    request.delegate            = delegate;
    return  request;
    
}


+ (id)requestWithName:(NSString *)name forServiceUrl:(NSString *)serviceURL requestMethod:(JRequestMethod)method responseParseFormat:(JResponseParseFormat)format params:(NSDictionary *)params withRequestBlock:(JsenRequestBlockHandler)customerBlock {
    NSAssert(![serviceURL isEqualToString:@""] && serviceURL,  @"ServiceURL is empty!!");
    JsenRequest * request = [[JsenRequest alloc] init];
    request.requestURL          = [request fixRequestUrlWithServiceURL:serviceURL params:params];
    request.requestName         = name;
    request.requestMethod       = method;
    request.responseParseFormat = format;
    request.params              = params;
    request.requestHandler      = customerBlock;
    return  request;
}

+ (id)requestWithName:(NSString *)name forServiceUrl:(NSString *)serviceURL requestMethod:(JRequestMethod)method responseParseFormat:(JResponseParseFormat)format params:(NSDictionary *)params success:(JsenRequestSuccess)success failed:(JsenRequestFailed)failed {
    NSAssert(![serviceURL isEqualToString:@""] && serviceURL,  @"ServiceURL is empty!!");
    JsenRequest * request = [[JsenRequest alloc] init];
    request.requestURL          = [request fixRequestUrlWithServiceURL:serviceURL params:params];
    request.requestName         = name;
    request.requestMethod       = method;
    request.responseParseFormat = format;
    request.params              = params;
    request.requestSuccess      = success;
    request.requestFailed       = failed;
    return  request;
    
}

#pragma mark - Private Method 
//拼接请求url
- (NSString *)fixRequestUrlWithServiceURL:(NSString *)serviceURL params:(NSDictionary *)params {
    NSMutableString *requestUrl = nil;
    if (params != nil && self.requestMethod == JRequestMethodGet) {
        requestUrl = (NSMutableString *)Domain_Sub_Interface(serviceURL);
        NSString * subInterface = nil;
        if ([requestUrl containsString:@"?"]) {
           subInterface = [NSString stringWithFormat:@"%@&%@",serviceURL,[params SplicingNetParams]];
        } else {
            subInterface = [NSString stringWithFormat:@"%@?%@",serviceURL,[params SplicingNetParams]];
            
        }
        requestUrl = (NSMutableString *)subInterface;
        
    } else {
        
        requestUrl = (NSMutableString *)Domain_Sub_Interface(serviceURL);
        
    }
    return requestUrl;
}

//拼接上传文件类型的data
- (NSData *)fixtMultipartPostBodyData {
    
    
    NSData *fileData = nil;
    for (id obj in self.params) {
        if ([self.params[obj] isKindOfClass:[UIImage class]]) {
            fileData = UIImageJPEGRepresentation(self.params[obj], 1.0);
        }
    }
    
    NSMutableString * bodyString = [[NSMutableString alloc] init];
    for (id obj in self.params) {
        if (![self.params[obj] isKindOfClass:[UIImage class] ]) {
            [bodyString appendFormat:@"--%@\r\n",BOUNDARY];
            [bodyString appendFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",obj];
            [bodyString appendFormat:@"%@\r\n",self.params[obj]];
        }
    }
    
    for (id obj in self.params) {
        if ([self.params[obj] isKindOfClass:[UIImage class] ]) {
            [bodyString appendFormat:@"--%@\r\n", BOUNDARY];
            [bodyString appendFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"img_avatar.png\"\"\r\n",obj];
            [bodyString appendFormat:@"Content-Type: image/jpeg\r\n\r\n"];
            
        }
        
    }
    NSMutableData *bodyData = [NSMutableData data];
    [bodyData appendData:[bodyString dataUsingEncoding:NSUTF8StringEncoding]];
//    //图片数据
    [bodyData appendData:fileData];
    NSString *endStr = [NSString stringWithFormat:@"\r\n--%@--\r\n",BOUNDARY];
    [bodyData appendData:[endStr dataUsingEncoding:NSUTF8StringEncoding]];
    return bodyData;
}

//根据返回的数据 格式化成对应的json xml
- (id)getParsedDic:(NSData *)data {
    id obj = nil;
    switch (self.responseParseFormat) {
        case JResponseParseFormatJSON:
            obj = [self getJsonObject:data];
            break;
        case JResponseParseFormatXML:
            //TODO
            break;
            
        default:
            break;
    }
    return obj;
}

//将data 格式化成json
- (id)getJsonObject:(NSData *)data {
    //TODO: error Handler
    return [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
}

- (void)startPostRequest{
    NSURL *url =[NSURL URLWithString:self.requestURL];
    //2.创建请求
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setTimeoutInterval:Service_TimeOut];
    NSString *requestBody = self.params == nil ? @"" : [self.params SplicingNetParams];
    NSData   *requestBodyData = [requestBody dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:requestBodyData];
    
    //3.创建会话（这里使用了一个全局会话）并且启动任务
    NSURLSession *session=[NSURLSession sharedSession];
    //从会话创建任务
    NSURLSessionDataTask * dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        [self dealResponse:data error:error];
    }];
    self.dataTask = dataTask;
    [self.dataTask resume];
    
}

- (void)startGetRequest {
    NSURL *url = [NSURL URLWithString:self.requestURL];
    //2.创建请求
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    [request setTimeoutInterval:Service_TimeOut];
    //3.创建会话（这里使用了一个全局会话）并且启动任务
    NSURLSession *session=[NSURLSession sharedSession];
    //从会话创建任务
    NSURLSessionDataTask * dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        [self dealResponse:data error:error];
    }];
    self.dataTask = dataTask;
    [self.dataTask resume];
    
}

- (void)startMultipartPost {
    NSURL *url = [NSURL URLWithString:self.requestURL];
    //2.创建请求
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    [request setTimeoutInterval:Service_TimeOut];
    [request setCachePolicy:NSURLRequestReturnCacheDataElseLoad];
    [request setHTTPMethod:@"POST"];
    
    //3.设置请求头
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; charset=utf-8;boundary=%@", BOUNDARY];
    [request setValue:contentType forHTTPHeaderField:@"Content-Type"];
    NSData * bodyData = [self fixtMultipartPostBodyData];
    [request setHTTPBody:bodyData];
    
    //4.创建网络会话
    NSURLSession *session=[NSURLSession sharedSession];
    
    //5.创建网络上传任务
    NSURLSessionUploadTask *uploadTask=[session uploadTaskWithRequest:request fromData:bodyData completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        [self dealResponse:data error:error];
    }];
    self.uploadTask = uploadTask;
    
    //6.发送网络任务
    [self.uploadTask resume];
    
}

- (void)startPut{
    
    
}

#pragma mark - deal net ly method
//处理返回数据
- (void)dealResponse:(NSData *)data error:(NSError *)error {
    if (error == nil){
        [self receivedData:data];
    }else if (error != nil && error.code == JRequestErrorCodeTimeOut) {
        [self timedOut:error];
        JSENLOGPRINT(@"error log:%@",error.localizedDescription);
    }else if (error != nil){
        [self downloadError:error];
        JSENLOGPRINT(@"error log:%@",error.localizedDescription);
    }
    
}

//成功接收到返回值
- (void)receivedData:(NSData *)data {
    id object = [self getParsedDic:data];
    NSDictionary *userInfo    = @{
                               @"data":object
                               };
    NSDictionary *responseDic = @{
                                  @"serviceName" : self.requestName,
                                  @"status":@"200",
                                  @"userInfoDic":userInfo
                                  };
    [self requestDidFinished:[[JsenRequestResponseSuccess alloc] initWithResponse:responseDic]];

}

//超时
- (void)timedOut:(NSError *)error {
    //TODO
    NSDictionary *userInfo    = @{
                               @"data" : error.userInfo
                               };
    NSDictionary *responseDic = @{
                                  @"serviceName" : self.requestName,
                                  @"status":@"256",
                                  @"userInfoDic":userInfo,
                                  @"errorInfo":error.localizedDescription
                                  };
    [self requestDidFailed:[[JsenRequestResponseFailure alloc] initWithResponse:responseDic]];
}

//请求失败
- (void)downloadError:(NSError *)error {
    //TODO
    NSDictionary *userInfo    = @{
                               @"data" : error.userInfo
                               };
    NSDictionary *responseDic = @{
                                  @"serviceName" : self.requestName,
                                  @"status":[NSString stringWithFormat:@"%ld",error.code],
                                  @"userInfoDic":userInfo,
                                  @"errorInfo":error.localizedDescription
                                  };
    [self requestDidFailed:[[JsenRequestResponseFailure alloc] initWithResponse:responseDic]];
}

- (void)requestDidStarted {
    if (self.delegate) {
        [self.delegate requestDidStarted:self.requestName];
        return;
    }
    
    if (self.requestHandler) {
        self.requestHandler(self, JRequestingStatusStarted, nil, nil);
        return;
    }

    JSENLOGINFO(@"%@: requestDidStarted: %@%@", self.requestName, Domain_Ture_BaseURL, self.requestURL);
}

- (void)requestDidCanceled {
    if (self.delegate) {
        [self.delegate requestDidCanceled:self.requestName];
        return;
    }
    
    if (self.requestHandler) {
        _requestHandler(self, JRequestingStatusCanceled, nil, nil);
        return;
    }
    JSENLOGINFO(@"%@: requestDidCanceled: %@%@", self.requestName, Domain_Ture_BaseURL, self.requestURL);
}

- (void)requestDidFinished:(JsenRequestResponseSuccess *)response {
    if (self.delegate) {
        [self.delegate requestDidFinished:response];
        return;
    }
    
    if (self.requestHandler) {
        self.requestHandler(self, JRequestingStatusFinished, response, nil);
        return;
    }
    
    if (self.requestSuccess) {
        self.requestSuccess(self, JRequestingStatusFinished, response);
        return;
    }
    JSENLOGINFO(@"%@: requestDidFinished , %@", self.requestName, response.userInfo);
}

- (void)requestDidFailed:(JsenRequestResponseFailure *)response {
    if (self.delegate) {
        [self.delegate requestDidFailed:response];
        return;
    }
    
    if (self.requestHandler) {
        _requestHandler(self,JRequestingStatusFailed,nil,response);
        return;
    }
    
    if (self.requestFailed) {
        self.requestFailed(self,JRequestingStatusFailed,response);
        return;
    }
    JSENLOGINFO(@"%@: requestDidFailed , %@", self.requestName, response.errorInfo);
}


@end
