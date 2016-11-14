//
//  UIColor+HexColor.h
//  XiuChe
//
//  Created by Macro on 16/5/13.
//  Copyright © 2016年 嗒嗒修车. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexColor)

// 根据16进制颜色值返回Color
+(UIColor *)colorWithHexString:(NSString *)stringToConvert;

@end
