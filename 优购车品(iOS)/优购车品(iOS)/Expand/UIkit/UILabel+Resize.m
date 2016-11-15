//
//  UILabel+Resize.m
//  Manager
//
//  Created by Nanker on 14-6-18.
//  Copyright (c) 2014年 Jason Tse. All rights reserved.
//

#import "UILabel+Resize.h"
#import "UIView+Frame.h"
#import "Const.h"

@implementation UILabel (Resize)


- (UILabel *)initResizeLabelWithText:(NSString *)text width:(CGFloat)width font:(UIFont *)font
{
    return [self initResizeLabelWithText:text width:width font:font isFixedWidth:YES];
}


/**
 *  自适应高度的label
 *
 *  @param text         文字
 *  @param width        宽度
 *  @param font         字体
 *  @param isFixedWidth 是否固定宽度
 *
 *  @return label
 */
- (UILabel *)initResizeLabelWithText:(NSString *)text width:(CGFloat)width font:(UIFont *)font isFixedWidth:(BOOL)isFixedWidth
{
    return [self initResizeLabelWithText:text width:width font:font isFixedWidth:isFixedWidth lineBreakMode:NSLineBreakByWordWrapping];
    //UILineBreakModeTailTruncation
}


- (UILabel *)initResizeLabelWithText:(NSString *)text width:(CGFloat)width font:(UIFont *)font isFixedWidth:(BOOL)isFixedWidth lineBreakMode:(NSLineBreakMode)lineBreakMode
{
    if (self = [super init]) {
        self.numberOfLines = 0;
        self.text = text;
        self.font = font;
        self.lineBreakMode = lineBreakMode;
        CGSize constraint = CGSizeMake(width, 20000.0f);
        CGSize size = [text sizeWithFont:font constrainedToSize:constraint lineBreakMode:self.lineBreakMode];
        CGFloat totalWidth = isFixedWidth ? width : size.width;
        [self setSize:CGSizeMake(totalWidth, size.height)];
    }
    return self;
}


/**
 *  设置一些常用的属性
 *
 *  @param text          文字
 *  @param font          字体
 *  @param textColor     颜色
 *  @param textAlignment 对齐方式
 */
- (void)setText:(NSString *)text andFont:(UIFont *)font andTextColor:(UIColor *)textColor andTextAlignment:(NSTextAlignment)textAlignment
{
    [self setText:text];
    [self setFont:font];
    [self setTextColor:textColor];
    [self setTextAlignment:textAlignment];
    [self setBackgroundColor:[UIColor clearColor]];
}


/**
 *  返回固定行数的label
 *
 *  @param lines 行数
 *  @param width 宽度
 *  @param font  字体
 *
 *  @return label
 */
- (UILabel *)initResizeLabelWithLines:(NSInteger)lines width:(CGFloat)width font:(UIFont *)font
{
    NSString *text = @"";
    NSInteger number = IOS8_OR_LATER ? lines-1 : lines;
    for (int i = 0; i < number; i++) {
        text = [text stringByAppendingString:@"\n"];
    }
    UILabel *label = [[UILabel alloc] initResizeLabelWithText:text width:width font:font];
    label.numberOfLines = lines;
    return label;
}


/**
 *  返回固定行数的label，超出部分不显示
 *
 *  @param lines 最大行数
 *  @param text  文字
 *  @param width 宽度
 *  @param font  字体
 *
 *  @return label
 */
- (UILabel *)initLabelWithMaxLines:(NSInteger)lines text:(NSString *)text width:(CGFloat)width font:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] initResizeLabelWithText:text width:width font:font];
    UILabel *linesLabel = [[UILabel alloc] initResizeLabelWithLines:lines width:width font:font];
    label.height = fmin(label.height, linesLabel.height);
    label.height = fmax(label.height, font.pointSize + 4);
    return label;
}


@end

