//
//  DDTabViewController.m
//  优购车品(iOS)
//
//  Created by 嗒嗒修车 on 16/9/19.
//  Copyright © 2016年 嗒嗒. All rights reserved.
//

#import "DDTabViewController.h"
#import "DDFindViewController.h"
#import "DDHomeViewController.h"
#import "DDMineViewController.h"
#import "DDThirdViewController.h"
#import "DDNaviViewController.h"

@interface DDTabViewController ()

@end

@implementation DDTabViewController


+(void)initialize
{
    // 设置为不透明
    [[UITabBar appearance] setTranslucent:NO];
    // 设置背景颜色
    [UITabBar appearance].barTintColor = [UIColor colorWithRed:0.97f green:0.97f blue:0.97f alpha:1.00f];
    
    // 拿到整个导航控制器的外观
    UITabBarItem * item = [UITabBarItem appearance];
    item.titlePositionAdjustment = UIOffsetMake(0, 1.5);
    
    // 普通状态
    NSMutableDictionary * normalAtts = [NSMutableDictionary dictionary];
    normalAtts[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    normalAtts[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.62f green:0.62f blue:0.63f alpha:1.00f];
    [item setTitleTextAttributes:normalAtts forState:UIControlStateNormal];
    
    // 选中状态
    NSMutableDictionary *selectAtts = [NSMutableDictionary dictionary];
    selectAtts[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    selectAtts[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.42f green:0.33f blue:0.27f alpha:1.00f];
    [item setTitleTextAttributes:selectAtts forState:UIControlStateSelected];
}



-(void)addChildViewControllerWithClassname:(NSString*)name imageName:(NSString*)imageName title:(NSString*)title
{
    UIViewController *vc = [[NSClassFromString(name) alloc] init];
    DDNaviViewController *navi = [[DDNaviViewController alloc]initWithRootViewController:vc];
    navi.tabBarItem.title = title;
    navi.tabBarItem.image = [UIImage imageNamed:imageName];
    navi.tabBarItem.selectedImage = [[UIImage imageNamed:[imageName stringByAppendingString:@"_press"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:navi];
}


-(void)isNeedHideTabbar:(BOOL)isHide
{
    self.tabBar.hidden = isHide;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addChildViewControllerWithClassname:[DDHomeViewController description] imageName:@"home" title:@"首页"];
    [self addChildViewControllerWithClassname:[DDFindViewController description] imageName:@"Found" title:@"发现"];
    [self addChildViewControllerWithClassname:[DDThirdViewController description] imageName:@"audit" title:@"购物车"];
    [self addChildViewControllerWithClassname:[DDMineViewController description] imageName:@"newstab" title:@"我的"];
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
