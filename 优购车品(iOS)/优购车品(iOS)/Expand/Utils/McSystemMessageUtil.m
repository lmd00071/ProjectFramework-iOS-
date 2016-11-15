//
//  McSystemMessageUtil.m
//  Test
//
//  Created by 李明丹 on 15/11/4.
//  Copyright © 2015年 lmd. All rights reserved.
//

#import "McSystemMessageUtil.h"
#import <NetworkExtension/NEHotspotHelper.h>
#import <AdSupport/AdSupport.h>
#import <UIKit/UIKit.h>
#import <SystemConfiguration/CaptiveNetwork.h>
#import "McKeyChain.h"

#define kDDUDID    @"udid"

@implementation McSystemMessageUtil

/**
 *  获取系统版本号
 */
+ (NSString*)getSystemVersion{
    CGFloat systemVersion = [UIDevice currentDevice].systemVersion.floatValue;
    return [NSString stringWithFormat:@"%.2f",systemVersion];
}

/**
 *  获取App的版本号
 */
+ (NSString*)appVersion{
    NSString *version = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    return version;
}

/**
 *  获取App的内建版本号
 */
+ (NSString*)appBuildVersion{
    NSString *buildVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
    return buildVersion;
}

+ (BOOL)netEnvironmentIsWifi{
    NSString *wifiMac = [self getWifiMac];
    if ([wifiMac isEqualToString:@""] || !wifiMac) {
        return NO;
    }
    return YES;
}

//获取当前wifi
+ (CFDictionaryRef)getCurrentWifiInfo{
    CFArrayRef wifiInterfaces = CNCopySupportedInterfaces();
    if (!wifiInterfaces) {
        LMDLog(@"当前没有使用或者没有可用wifi！");
        return nil;
    }
    NSArray *interfaces = (__bridge NSArray*)wifiInterfaces;
    
    NSString *interfaceName = interfaces[0];
    CFDictionaryRef wifiInfo = CNCopyCurrentNetworkInfo((__bridge CFStringRef)interfaceName);
    return wifiInfo;
}

/**
 *  获取当前使用的wifi的名称
 *
 */
+ (NSString*)getWifiName{
    NSString *wifiName = nil;
    CFDictionaryRef wifiInfo = [self getCurrentWifiInfo];
    if (!wifiInfo) {
        LMDLog(@"网络信息获取失败!");
        return nil;
    }else{
        NSDictionary *networkInfo = (__bridge NSDictionary*)wifiInfo;
        LMDLog(@"当前wifi的名称:  %@",networkInfo[(__bridge NSString*)kCNNetworkInfoKeySSID]);
        return networkInfo[(__bridge NSString*)kCNNetworkInfoKeySSID];
    }
    
    return wifiName;
}

/**
 *  获取当前使用的wifi的mac地址
 *
 */
+ (NSString*)getWifiMac{
     CFDictionaryRef wifiInfo = [self getCurrentWifiInfo];
    if (!wifiInfo) {
        LMDLog(@"网络信息获取失败！");
        return nil;
    }else{
        NSDictionary *networkInfo = (__bridge NSDictionary*)wifiInfo;
        LMDLog(@"当前wifi的mac地址为： %@",networkInfo[(__bridge NSString*)kCNNetworkInfoKeyBSSID]);
        return networkInfo[(__bridge NSString*)kCNNetworkInfoKeyBSSID];
    }
}

/**
 *  获取设备的IDFA
 */
+ (NSString*)getDeviceIDFA{
    NSString *idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    if (!idfa || [idfa isEqualToString:@""]) {
        idfa = @"";
    }
    return idfa;
}

/**
 *  获取设备的IDFV
 */
+ (NSString*)getDeviceIDFV{
    NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    return idfv;
}

/**
 *  获取UUID
 *
 */
+ (NSString*)uuid{
    NSString *u = [McKeyChain load:kDDUDID];
    if (u && ![u isEqualToString:@""]) {
        return u;
    }
    [McKeyChain save:kDDUDID data:[McSystemMessageUtil setupUuid]];
    return [McKeyChain load:kDDUDID];
}

/**
 *  生成UUID
 *
 */
+ (NSString*)setupUuid{
    CFUUIDRef puuid = CFUUIDCreate(nil);
    CFStringRef uuidString = CFUUIDCreateString(nil, puuid);
    NSString * result = (NSString*)CFBridgingRelease(CFStringCreateCopy(NULL, uuidString));
    CFRelease(puuid);
    CFRelease(uuidString);
    LMDLog(@"============UUID: %@", result);
    return result;
}

@end
