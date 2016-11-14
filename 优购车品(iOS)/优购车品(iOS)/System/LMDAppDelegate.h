//
//  AppDelegate.h
//  优购车品(iOS)
//
//  Created by 嗒嗒修车 on 16/9/19.
//  Copyright © 2016年 嗒嗒. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDTabViewController.h"


@interface LMDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(nonatomic,strong)DDTabViewController *tabBarController;
@end

