//
//  LMDHTTPSRequestManager.m
//  优购车品(iOS)
//
//  Created by 嗒嗒修车 on 16/9/20.
//  Copyright © 2016年 嗒嗒. All rights reserved.
//

#import "LMDHTTPSRequestManager.h"
#import <AFNetworking.h>
#import <netinet/in.h>
#import "Reachability.h"
#import "UIUtils.h"
#import "Const.h"


// 服务器地址

#ifdef  DEBUG
//    #define kDDAPIBaseURL @"http://192.168.0.201/api"
#define kDDAPIBaseURL @"http://120.24.65.96/api"
#else
#define kDDAPIBaseURL @"http://120.24.65.96/api"
#endif


static CGFloat const timeout = 3.0;
@implementation LMDHTTPSRequestManager


+(LMDHTTPSRequestManager *)requestManager
{
    static LMDHTTPSRequestManager *requestManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        requestManager = [[LMDHTTPSRequestManager alloc]init];
    });
    return requestManager;
}


-(void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    //申明返回的结果是text/html
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    [mgr GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
}


-(void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(id))failure
{
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    mgr.requestSerializer.timeoutInterval = timeout;
    
    [mgr POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

-(void)AFNetworkStatus
{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager startMonitoring];
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                LMDLog(@"未知网络状态");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"无网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"wifi网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"蜂窝数据");
                break;
            default:
                break;
        }
        
    }];
}
































@end
