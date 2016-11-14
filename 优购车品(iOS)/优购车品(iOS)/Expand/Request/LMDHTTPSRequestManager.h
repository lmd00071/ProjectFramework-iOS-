//
//  LMDHTTPSRequestManager.h
//  优购车品(iOS)
//
//  Created by 嗒嗒修车 on 16/9/20.
//  Copyright © 2016年 嗒嗒. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LMDHTTPSRequestManager : NSObject

+(LMDHTTPSRequestManager *)requestManager;

-(void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;

-(void)post:(NSString *)url params:(NSDictionary*)params success:(void(^)(id responseObj))success failure:(void(^)(id responseObj))failure;

-(void)AFNetworkStatus;

@end
