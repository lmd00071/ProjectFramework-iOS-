//
//  APIConfig.h
//  XiuChe
//
//  Created by Macro on 16/5/17.
//  Copyright © 2016年 嗒嗒修车. All rights reserved.
//

//#define kOutSideBaseNet     @"http://151358ri98.imwork.net/api"
//
//
//#ifdef  kOutSideBaseNet
//    #define kDDAPIBaseURL kOutSideBaseNet
//#else
//    #define kDDAPIBaseURL @"http://192.168.0.201/api"
//#endif


/**************************用户相关***************************/
// 游客登陆
#define kDDVisitorLogin         @"/member/guest"
// 登录
#define kDDLogin                @"/member/login"

// 第三方登录
#define kDDThirdLogin           @"/member/loginoauth"

// 发送手机验证码
#define kDDSendVerify           @"/member/mobile"

// 注册
#define kDDRegister             @"/member"

// 退出
#define kDDLogout               @"/member/logout"

// 找回密码
#define kDDForgetPassword       @"/member/forgetpassword"

// 修改密码
#define kDDChangePassword       @"/member/password"

// 修改手机号码
#define kDDChangeMobile         @"/member/mobile"

// 修改个人信息
#define kDDChangePersonalInfo(s,...)   [NSString stringWithFormat:@"%@?member_id=%@",@"/member/profile",s]

// 修改头像
#define kDDChangeHeader         @"/member/avatar"

// 身份验证
#define kDDCheckIdentity        @"/member/checkidentity"

// 用户注册协议接口
#define kDDUserProtocol         @"/member/agreement"

// 修改用户设置
#define kDDChangeUserSetting    @"/membersetting"

// 获取用户设置
#define kDDGetUserSetting       @"/membersetting"

/*************************公告与消息***************************/

// 公告列表   GET
#define kDDNotice               @"/notice"

// 公告详情   GET
#define kDDNoticeDetail         @"/notice/"

// 获取未读公告数量  GET
#define kDDNoticeNotReadCount   @"/notice/count"

// 用户消息列表  GET
#define kDDMemberNotificationList @"/member/sms/"

// 查看用户消息详情 GET
#define kDDMemberNotificationDetail @"/member/sms/"

// 发送或回复消息
#define kDDSendOrReplyMessage    @"/member/sms/send"

// 用户消息标记为已读
#define kDDUserNotificationRead  @"/member/sms/read/"

// 删除用户信息
#define kDDDeleteUserMessage     @"/member/sms/remove/"

/**************************帮助中心***************************/

// 获取分类 GET
#define kDDGetHelpCategories    @"/faq/cat"

// 问题列表 GET
#define kDDQuestionList         @"/faq/list/"

/**************************私人客服***************************/

// 用户反馈
#define kDDUserFeedBack         @"/message"

/***************************系统***************************/

// 获取最新版本号  Get
#define kDDGetNewestVersion     @"/system/version"

// 系统更新 Get
#define kDDSystemUpdate         @"/system/update"

// 关于嗒嗒
#define kDDAbout                @"/system/about"

// 获取后端内容通用版 GET
#define kDDGetCommonModel       @"/system/getinfo/"

//获取首页轮播图
#define kDDGetHomeRoundFigure   @"/config/homepage/"

/***************************车震***************************/

// 车震列表
#define kDDVehicleList          @"/driveinsex"

// 车震详情
#define kDDVehicleDetail        @"/driveinsex/"

// 新增车震
#define kDDAddVehicle           @"/driveinsex/"

/***************************健康速测***************************/

// 速测列表
#define kDDHealthList           @"/health"

// 速测详情 GET
#define kDDHealthDetail         @"/health/"

// 新增速测
#define kDDAddHealthData        @"/health/"

// 删除速测
#define kDDDeleteHealthData     @"/health/"

// 批量删除速测
#define kDDBatchDeleteHealthData @"/health"

/***************************驾驶行为***************************/

// 驾驶行为列表 GET
#define kDDDriveActionList      @"/driveaction/"

// 驾驶行为详情 GET
#define kDDDriveActionDetail    @"/driveaction/"

// 新增驾驶行为
#define kDDAddDriveAction       @"/driveaction/"

// 删除驾驶行为
#define kDDDeleteDriveAction   @"/driveaction/"

// 批量删除驾驶行为
#define kDDBatchDeleteDriveActionData @"/driveaction"

//获取驾驶行为的详细事件记录
#define kDDGetDriveAction   @"/driveaction/detail?id="

//获取能查询违章的所有城市列表
#define kDDGetAllCities   @"/weizhang/allcities"

#define kDDViolation      @"/weizhang/query"

