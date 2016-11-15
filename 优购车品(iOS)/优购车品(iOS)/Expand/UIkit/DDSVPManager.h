//
//  DDSVPManager.h
//  XiuChe
//
//  Created by lmd on 16/5/16.
//  Copyright © 2016年 嗒嗒修车. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDSVPManager : NSObject

// 单例
+ (instancetype)shareInstance;

// 显示提示信息
- (void)showWarmingMsg:(NSString*)msg;

// 显示网络进度圈
- (void)showActivity;

// 隐藏网络进度圈
- (void)hideActivity;

@end
