//
//  UIUtils.m
//  dadaxiuche
//
//  Created by terryh on 16/4/19.
//  Copyright © 2016年 ddxc. All rights reserved.
//

#import "UIUtils.h"
#import "Const.h"
#import "MBProgressHUD.h"
#import "AppDelegate.h"
#import "UILabel+Resize.h"
#import "UIView+Frame.h"

@implementation UIUtils



#pragma mark - 淡出提示框
+ (void)alertDisappearMessage:(NSString *)message
{
    CGFloat maxWidth = SCREEN_WIDTH - 4 * 20;
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:appDelegate.window animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    UILabel *messageLabel = [[UILabel alloc] initResizeLabelWithText:message width:maxWidth font:UIFontSize(16) isFixedWidth:NO];

    
    messageLabel.textColor = [UIColor whiteColor];
    UIView *customView = [[UIView alloc] initWithSize:CGSizeMake(messageLabel.width, messageLabel.height)];
    [customView addSubview:messageLabel];
    hud.customView = customView;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:3.618];
}



@end
