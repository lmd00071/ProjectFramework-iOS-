//
//  LMDItem.m
//  优购车品(iOS)
//
//  Created by 李明丹 on 2016/11/14.
//  Copyright © 2016年 嗒嗒. All rights reserved.
//

#import "LMDItem.h"

@interface LMDItem () <NSCoding>

@end

@implementation LMDItem


-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if ([super init]) {
        _string = [aDecoder decodeObjectForKey:@"string"];
        _number = [aDecoder decodeIntForKey:@"number"];
        _Array = [aDecoder decodeObjectForKey:@"array"];
    }
    
    return self;
}


-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.string forKey:@"string"];
    [aCoder encodeObject:self.Array forKey:@"array"];
    [aCoder encodeInt:self.number forKey:@"number"];
}


@end
