

#import <Foundation/Foundation.h>
#import "Weixin/WXApi.h"

@interface DLSocialWechatHandler : NSObject <WXApiDelegate>

- (BOOL)handleOpenURL:(NSURL *)url;

/**
 设置微信AppId
 
 @param app_Id 微信应用Id
 
 */
+ (void)setWXAppId:(NSString *)app_Id;

@end
