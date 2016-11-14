//
//  DDNaviViewController.m
//  优购车品(iOS)
//
//  Created by 嗒嗒修车 on 16/9/19.
//  Copyright © 2016年 嗒嗒. All rights reserved.
//

#import "DDNaviViewController.h"

@interface DDNaviViewController ()

@end

@implementation DDNaviViewController


-(id)initWithRootViewController:(UIViewController *)rootViewController
{
    if (self = [super initWithRootViewController:rootViewController]) {
        [self setUI];
    }
    return self;
}

-(void)setUI
{
    self.navigationBar.barTintColor = [UIColor colorWithRed:0.42f green:0.33f blue:0.27f alpha:1.00f];
    self.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


@end
