//
//  FirstGuideViewController.m
//  优购车品(iOS)
//
//  Created by 嗒嗒修车 on 16/9/20.
//  Copyright © 2016年 嗒嗒. All rights reserved.
//

#import "FirstGuideViewController.h"
#import "DDTabViewController.h"

@interface FirstGuideViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)UIPageControl *pageControl;
@property (nonatomic,strong)UIButton *startBtn;

@end

@implementation FirstGuideViewController


-(void)setImageList:(NSArray *)imageList
{
    _imageList = imageList;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    if (!_imageList) {
        _imageList = @[@"9",@"10",@"11",@"12"];
    }
    [self setUpUI];
    [self setUpData];
}



-(void)setUpUI
{
    self.scrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];
    self.scrollView.contentSize = CGSizeMake(kScreenWidth*self.imageList.count, kScreenHeight);
    
    UIPageControl *pageCtl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 0, CGRectGetHeight(self.scrollView.bounds), 20)];
    pageCtl.center = CGPointMake(self.view.center.x, CGRectGetHeight(self.scrollView.bounds) - 50);
    pageCtl.backgroundColor = [UIColor clearColor];
    self.pageControl = pageCtl;
    self.pageControl.numberOfPages = self.imageList.count;
    [self.view addSubview:self.pageControl];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth - 100, 40)];
    btn.center = CGPointMake(kScreenWidth/2, kScreenHeight-60);
    btn.backgroundColor = [UIColor clearColor];
    btn.layer.borderColor = kDDMainBGColorRGBColor.CGColor;
    btn.layer.borderWidth = 1;
    btn.layer.cornerRadius = 5;
    btn.layer.masksToBounds = YES;
    [btn setTitle:@"立即开始" forState:UIControlStateNormal];
    [btn setTitleColor:kDDMainBGColorRGBColor forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickBtnToStart:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn];
    btn.hidden = YES;
    _startBtn = btn;
}

-(void)setUpData
{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isFirstComoin"];
    for (int i = 0; i<self.imageList.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*kScreenWidth, 0, kScreenWidth, kScreenHeight)];
        NSString *imageName = [NSString stringWithFormat:@"%@",_imageList[i]];
        imageView.image = [UIImage imageNamed:imageName];
        [self.scrollView addSubview:imageView];
    }
}

-(void)clickBtnToStart:(UIButton*)sender
{
    DDTabViewController *vc = [[DDTabViewController alloc] init];

    [UIApplication sharedApplication].keyWindow.rootViewController = vc;
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int index = fabs(scrollView.contentOffset.x)/scrollView.frame.size.width;
    self.pageControl.currentPage = index;
    if (index == self.imageList.count - 1) {
        self.startBtn.hidden = NO;
    }
    else
    {
        self.startBtn.hidden = YES;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
