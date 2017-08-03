//
//  SecondViewController.m
//  优购车品(iOS)
//
//  Created by 李明丹 on 2016/11/12.
//  Copyright © 2016年 嗒嗒. All rights reserved.
//

#import "SecondViewController.h"
#import "DDHomeViewController.h"
#import "SomeView.h"
#import "LMDItem.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"第二个页面字符串地址-----%p",self.chuanString);
}

- (IBAction)strchange:(UIButton *)sender {
    self.chuanString = @"你好";
    NSLog(@"改变之后的第二个页面字符串地址-----%p",self.chuanString);

}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    SomeView *view = [[SomeView alloc]init];
//    view.frame = CGRectMake(100, 300, 200, 250);
//    [self.view addSubview:view];
//    
//    
    NSLog(@"%@",self.chuanString);
    //解档和归档(固化和解固)
    LMDItem *item = [[LMDItem alloc]init];
    item.string = @"李明丹";
    item.number = 8;
    item.Array = @[@"iphone",@"ipad"];
    
    
    
    NSString *filepath = [NSHomeDirectory() stringByAppendingString:@"lmd.archiver"];
    BOOL success = [NSKeyedArchiver archiveRootObject:item toFile:filepath];
    if (success) {
        NSLog(@"归档成功");
    }
    
    LMDItem *second = [NSKeyedUnarchiver unarchiveObjectWithFile:filepath];
    
    NSLog(@"%@----%@-----%d",second.Array,second.string,second.number);
    
    
    
    NSString *homeDirectory = NSHomeDirectory();
    NSLog(@"path:%@", homeDirectory);
    
    
    
    //写入文件
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
     NSArray *array = [[NSArray alloc] initWithObjects:@"内容",@"content",nil];
    NSString *filePath = [path stringByAppendingPathComponent:@"testFile.txt"];
    [array writeToFile:filePath atomically:YES];
    
    
    NSLog(@"path:%@", filePath);
    
    NSArray *resuleArr = [[NSArray alloc]initWithContentsOfFile:filePath];
    NSLog(@"%@",resuleArr);
    
    
    [self addObserver:self forKeyPath:@"chuanString" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    

    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSLog(@"\\noldnum:%@ newnum:%@",[change valueForKey:@"old"],
          [change valueForKey:@"new"]);
    NSNotification * notice = [NSNotification notificationWithName:@"daohang" object:nil userInfo:nil];
    [[NSNotificationCenter defaultCenter]postNotification:notice];

    NSLog(@"%@",self.chuanString);
   

    
}


-(void)dealloc
{
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self removeObserver:self forKeyPath:@"chuanString"];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//
- (IBAction)iphoneAndipad:(UIButton *)sender {
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        NSLog(@"这是iphone点击的");
    }
    else
    {
        NSLog(@"这是ipad点击的");
           }
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
