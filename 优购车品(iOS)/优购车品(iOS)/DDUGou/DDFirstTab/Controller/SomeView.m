//
//  SomeView.m
//  优购车品(iOS)
//
//  Created by 李明丹 on 2016/11/13.
//  Copyright © 2016年 嗒嗒. All rights reserved.
//

#import "SomeView.h"


@interface SomeView ()

@property (nonatomic,copy)NSString *name;

@end



@implementation SomeView
@synthesize name = limingdan;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//-(void)setName:(NSString *)name
//{
//    limingdan = name;
//}
//
//-(NSString *)name
//{
//    return limingdan;
//}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


-(void)drawRect:(CGRect)rect

{
    limingdan = @"limingdan";
    
    NSLog(@"%@",limingdan);
    
    CGRect bouns = self.bounds;
    CGPoint center;
    center.x = bouns.origin.x + bouns.size.width/2;
    center.y = bouns.origin.y + bouns.size.height/2;
    UIBezierPath *path = [[UIBezierPath alloc]init];
    NSLog(@"%@",center);
    
    //此方法是一self这一试图为坐标系进行绘制的    不能以其他的坐标系
    [path addArcWithCenter:center radius:MIN(self.bounds.size.width, self.bounds.size.height)/2 startAngle:0 endAngle:M_PI*2 clockwise:YES];
//    NSLog(@"")
    [path stroke];
}

@end
