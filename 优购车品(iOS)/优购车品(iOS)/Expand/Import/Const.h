//
//  Const.h
//  优购车品(iOS)
//
//  Created by 李明丹 on 2016/4/9.
//  Copyright © 2016年 嗒嗒. All rights reserved.
//

#ifndef Const_h
#define Const_h



//屏幕  用于使用frame布局
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
//#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define SCREEN_HEIGHT (667 * SCREEN_WIDTH / 375)

//字体
#define UIFontSize(size) [UIFont systemFontOfSize:size]             //系统字体
#define UIFontBoldSize(size) [UIFont boldSystemFontOfSize:size]     //加粗系统字体
#define BoldFont(font) UIFontBoldSize(font.pointSize)               //字体加粗


//标准字体
#define Standard_Font_Largest UIFontSize(17)    //用在少数重要标题（如导航栏标题选中状态）
#define Standard_Font_Larger  UIFontSize(17)    //用在少数重要标题（如导航栏标题，分类名称等）
#define Standard_Font_Large   UIFontSize(16)    //用在一些较为重要的文字或操作按钮（如首页模块名称、资讯标题）
#define Standard_Font_Medium  UIFontSize(15)    //用于大多数文字（特别用于大段文字，如课程描述）
#define Standard_Font_Small   UIFontSize(12)    //用于辅助性文字（如更多、评论人名称、模块间小字）
#define Standard_Font_Smaller UIFontSize(10)    //用于辅助性文字（如次要备注信息等）



//判断系统版本的宏
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define IOS7_OR_LATER SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")
#define IOS8_OR_LATER SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")

#define SCREEN_SCALE [[UIScreen mainScreen] scale]

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

//是否竖屏
#define IsPortrait ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait || [UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)

//多语言
#define DadaLocalizedString(key) NSLocalizedString(key, nil)

static NSString * const ErrorMessageStringNetwotkError  = @"请检查网络，稍候再试！";

#define NAVIGATION_TITLE_SELECTED_FONT Standard_Font_Largest
#define NAVIGATION_TITLE_FONT          Standard_Font_Larger
#define TITLE_FONT                     Standard_Font_Large
#define CONTENT_FONT                   Standard_Font_Medium
#define NAME_FONT                      Standard_Font_Small
#define TAG_FONT                       Standard_Font_Smaller

#define SERVER_ADDRESS SCHO_LOCAL_CONFIG.localServerConfig.serverAddress //服务器地址


#define USER_NAME_STORE_STRING   @"user_name_store_string"



#endif /* Const_h */
