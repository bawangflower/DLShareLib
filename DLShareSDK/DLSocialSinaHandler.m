//
//  DLSocialSinaHandler.m
//  DLShareSDK
//
//  Created by 杭州东灵 on 16/6/23.
//  Copyright © 2016年 杭州东灵. All rights reserved.
//

#import "DLSocialSinaHandler.h"

@implementation DLSocialSinaHandler

- (BOOL)handleOpenURL:(NSURL *)url {
    
    return [WeiboSDK handleOpenURL:url delegate:self];
}

+ (void)openNewSinaWithAppKey:(NSString *)appKey;
{
  [WeiboSDK registerApp:appKey];
}

-(void)didReceiveWeiboRequest:(WBBaseRequest *)request {
    
}

/**
 *  微博
 *
 *  @param response 响应体。根据 WeiboSDKResponseStatusCode 作对应的处理.
 *  具体参见 `WeiboSDKResponseStatusCode` 枚举.
 */
- (void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    NSString *message;
    switch (response.statusCode) {
        case WeiboSDKResponseStatusCodeSuccess:
            message = @"分享成功";
            break;
        case WeiboSDKResponseStatusCodeUserCancel:
            message = @"取消分享";
            break;
        case WeiboSDKResponseStatusCodeSentFail:
            message = @"分享失败";
            break;
        default:
            message = @"分享失败";
            break;
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
