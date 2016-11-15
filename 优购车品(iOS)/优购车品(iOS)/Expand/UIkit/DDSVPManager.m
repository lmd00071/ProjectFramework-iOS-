//
//  DDSVPManager.m
//  XiuChe
//
//  Created by lmd on 16/5/16.
//  Copyright © 2016年 嗒嗒修车. All rights reserved.
//

#import "DDSVPManager.h"
#import "SVProgressHUD.h"

@implementation DDSVPManager

// 单例
+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    static DDSVPManager *manager = nil;
    dispatch_once(&onceToken, ^{
        manager = [[DDSVPManager alloc] init];
        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
        [SVProgressHUD setInfoImage:nil];
        [SVProgressHUD setBackgroundColor:[UIColor blackColor]];
        [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
        [SVProgressHUD setMinimumDismissTimeInterval:2];
    });
    return manager;
}

// 显示提示信息
- (void)showWarmingMsg:(NSString*)msg{
    [SVProgressHUD showInfoWithStatus:msg];
}

// 显示网络进度圈
- (void)showActivity{
    [SVProgressHUD show];
}

// 隐藏网络进度圈
- (void)hideActivity{
    [SVProgressHUD dismiss];
}

@end
