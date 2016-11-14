//
//  DDHomeViewController.m
//  优购车品(iOS)
//
//  Created by 嗒嗒修车 on 16/9/19.
//  Copyright © 2016年 嗒嗒. All rights reserved.
//

#import "DDHomeViewController.h"
#import "AdImageTool.h"
#import "AdvertiseViewController.h"
#import "LMDHTTPSRequestManager.h"
#import "TTSExample.h"
#import "SecondViewController.h"

@interface DDHomeViewController ()

@end

@implementation DDHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"首页";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushToad) name:@"pushtoad" object:nil];
    [AdImageTool getAdvertisingImage];//判断广告是否更新
    
    [[LMDHTTPSRequestManager requestManager] AFNetworkStatus];
    
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth - 200, 40)];
    btn.center = CGPointMake(kScreenWidth/2, kScreenHeight-160);
    btn.backgroundColor = [UIColor clearColor];
    btn.layer.borderColor = kDDMainBGColorRGBColor.CGColor;
    btn.layer.borderWidth = 1;
    btn.layer.cornerRadius = 5;
    btn.layer.masksToBounds = YES;
    [btn setTitle:@"叫床吧" forState:UIControlStateNormal];
    [btn setTitleColor:kDDMainBGColorRGBColor forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickBtnToStart:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn];


}

-(void)clickBtnToStart:(UIButton*)sender
{
    [self.navigationController pushViewController:[[SecondViewController alloc] init] animated:YES];
}



-(void)pushToad
{
    AdvertiseViewController *adVc = [[AdvertiseViewController alloc] init];
    [self.navigationController pushViewController:adVc animated:YES];
}


-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
