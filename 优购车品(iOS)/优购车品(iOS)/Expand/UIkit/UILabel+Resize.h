//
//  UILabel+Resize.h
//  Manager
//
//  Created by Nanker on 14-6-18.
//  Copyright (c) 2014年 Jason Tse. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Resize)

- (UILabel *)initResizeLabelWithText:(NSString *)text width:(CGFloat)width font:(UIFont *)font;
- (UILabel *)initResizeLabelWithText:(NSString *)text width:(CGFloat)width font:(UIFont *)font isFixedWidth:(BOOL)isFixedWidth;
- (void)setText:(NSString *)text andFont:(UIFont *)font andTextColor:(UIColor *)textColor andTextAlignment:(NSTextAlignment)textAlignment;
- (UILabel *)initResizeLabelWithLines:(NSInteger)lines width:(CGFloat)width font:(UIFont *)font;
- (UILabel *)initLabelWithMaxLines:(NSInteger)lines text:(NSString *)text width:(CGFloat)width font:(UIFont *)font;

@end

