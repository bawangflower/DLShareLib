//
//  DLSocialWechatHandler.m
//  DLShareSDK
//
//  Created by 杭州东灵 on 16/6/23.
//  Copyright © 2016年 杭州东灵. All rights reserved.
//

#import "DLSocialWechatHandler.h"

@implementation DLSocialWechatHandler

- (BOOL)handleOpenURL:(NSURL *)url {
    
    return [WXApi handleOpenURL:url delegate:self];
}

+ (void)setWXAppId:(NSString *)app_Id {
    [WXApi registerApp:app_Id];
}

/**
 *  处理来自微信的请求
 *
 *  @param resp 响应体。根据 errCode 作出对应处理。
 */
- (void)onResp:(BaseResp *)resp
{
    NSString *message;
    if(resp.errCode == 0) {
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
