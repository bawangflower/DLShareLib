
#import <Foundation/Foundation.h>

#import "weiboSDK/WeiboSDK.h"
/**
 使用最新版本的新浪微博官方SDK处理新浪微博SSO授权
 
 */
@interface DLSocialSinaHandler : NSObject <WeiboSDKDelegate>

- (BOOL)handleOpenURL:(NSURL *)url;

/**
 设置使用最新新浪微博SDK来处理SSO授权(通过客户端设置appkey进行访问)
 
 @param appKey 新浪App Key
 
 */

+ (void)openNewSinaWithAppKey:(NSString *)appKey;

@end
