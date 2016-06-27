//
//  DLSocialQQHandler.m
//  DLShareSDK
//
//  Created by 杭州东灵 on 16/6/23.
//  Copyright © 2016年 杭州东灵. All rights reserved.
//

#import "DLSocialQQHandler.h"

@implementation DLSocialQQHandler

- (BOOL)handleOpenURL:(NSURL *)url {
    
    return [QQApiInterface handleOpenURL:url delegate:self];
}

+ (void)setQQWithAppId:(NSString *)appId {
    TencentOAuth *tencentOAuth = [[TencentOAuth alloc] initWithAppId:appId andDelegate:nil];
    NSLog(@"%@",tencentOAuth.accessToken);
}

- (void)onReq:(QQBaseReq *)req {
    
}

- (void)isOnlineResponse:(NSDictionary *)response {
    
}

/**
 *  处理来至QQ的响应
 *
 *  @param resp 响应体，根据响应结果作对应处理
 */
- (void)onResp:(QQBaseResp *)resp
{
    NSString *message;
    if([resp.result integerValue] == 0) {
        message = @"分享成功";
    }else{
        message = @"分享失败";
    }
    
    UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:message message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAlertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            nil;
        }];
    
    [alertControl addAction:okAlertAction];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertControl animated:YES completion:^{
        
    }];
}



@end
