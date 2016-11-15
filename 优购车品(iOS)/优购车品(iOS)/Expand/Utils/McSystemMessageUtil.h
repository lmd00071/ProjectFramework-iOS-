//
//  McSystemMessageUtil.h
//  Test
//
//  Created by 李明丹 on 15/11/4.
//  Copyright © 2015年 lmd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface McSystemMessageUtil : NSObject

/**
 *  获取系统版本号
 */
+ (NSString*)getSystemVersion;

/**
 *  获取App的版本号
 */
+ (NSString*)appVersion;

/**
 *  获取App的内建版本号
 */
+ (NSString*)appBuildVersion;

/**
 *  当前网络环境是不是wifi环境
 *
 */
+ (BOOL)netEnvironmentIsWifi;

/**
 *  获取当前使用的wifi的名称
 */
+ (NSString*)getWifiName;

/**
 *  获取当前使用的wifi的mac地址
 */
+ (NSString*)getWifiMac;

/**
 *  获取设备的IDFA
 */
+ (NSString*)getDeviceIDFA;

/**
 *  获取设备的IDFV
 */
+ (NSString*)getDeviceIDFV;

/**
 *  获取UUID
 *
 */
+ (NSString*)uuid;

@end
